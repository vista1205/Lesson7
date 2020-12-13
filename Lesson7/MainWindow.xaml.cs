using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Lesson7
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public string connectionString = "Data Source=localhost;Initial Catalog=Persondb;User ID=PersonUser; Password=12345";

        public MainWindow()
        {
            InitializeComponent();

        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            using(SqlConnection connect = new SqlConnection(connectionString))
            {
                connect.Open();
                string com = "SELECT [Employee].[ФИО], [Employee].[Дата рождения], [Employee].[E-mail], [Department].[Департамент], [Employee].[Телефон] FROM [Employee], [Department] WHERE [Employee].[Департамент]=[Department].[ID];";
                SqlCommand command = new SqlCommand(com, connect);
                SqlDataAdapter dadapter;
                dadapter = new SqlDataAdapter();
                dadapter.SelectCommand = command;
                DataTable dt = new DataTable();
                dadapter.Fill(dt);
                allEmployeeDataGrid.DataContext = dt.DefaultView;
            }
            using (SqlConnection connect = new SqlConnection(connectionString))
            {
                connect.Open();
                string com = "SELECT [Департамент] FROM [Department];";
                SqlCommand command = new SqlCommand(com, connect);
                SqlDataAdapter dadapter = new SqlDataAdapter();
                dadapter.SelectCommand = command;
                DataTable dt = new DataTable();
                dadapter.Fill(dt);
                allDepComboBox.ItemsSource = dt.DefaultView;
            }
        }
    }
}
