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
        public string connectionString = "Data Source=localhost;Initial Catalog=PersonDB;User ID=PersonUser; Password=12345";
        public List<Departments> depListS = new List<Departments>();
        SqlConnection connection;
        SqlDataAdapter adapter;
        DataTable dt;

        public MainWindow()
        {
            InitializeComponent();
            depListS = GetDepartments();
            depList.ItemsSource = depListS;

        }
        private List<Departments> GetDepartments()
        {
            List<Departments> dep = new List<Departments>();
            string sqlExp = "SELECT * FROM Departament;";
            using(SqlConnection connect=new SqlConnection(connectionString))
            {
                connect.Open();
                SqlCommand command = new SqlCommand(sqlExp, connect);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        var depart = new Departments()
                        {
                            NameDep = reader.GetString(1)
                        };
                        dep.Add(depart);
                    }
                }
                reader.Close();
            }
            return dep;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            GetDepartments();
        }
               private List<Employee> GetEmployees()
      {
          List<Employee> employeesList = new List<Employee>();
          string sqlExp = "SELECT * FROM Employee;";
          using(SqlConnection connect=new SqlConnection(connectionString))
          {
              connect.Open();
              SqlCommand command = new SqlCommand(sqlExp, connect);
              SqlDataReader reader = command.ExecuteReader();
              if (reader.HasRows)
              {
                  while (reader.Read())
                  {
                        string depo = reader.GetString(2);
                      var employee = new Employee()
                      {
                          ID = Convert.ToInt32(reader.GetValue(0)),
                          FIO=reader.GetString(1),                          
                          Department=(Departments)reader.GetString(2),
                      }
                  }
              }
          }
      }
    }
}
