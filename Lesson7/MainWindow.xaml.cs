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
        DataTable dtGeneral;
        DataTable dtDepart;

        public MainWindow()
        {
            InitializeComponent();

        }
        private void ObnvDepartment()
        {
            using (SqlConnection connect = new SqlConnection(connectionString))
            {
                connect.Open();
                string com = "SELECT * FROM [Department];";
                SqlCommand command = new SqlCommand(com, connect);
                SqlDataAdapter dadapter = new SqlDataAdapter();
                dadapter.SelectCommand = command;
                dtDepart = new DataTable();
                dadapter.Fill(dtDepart);
                alldepDataGrid.DataContext = dtDepart.DefaultView;
                connect.Close();
            }
        }
        private void ObnvEmployee()
        {
            using (SqlConnection connect = new SqlConnection(connectionString))
            {
                connect.Open();
                string com = "SELECT [Employee].[ID], [Employee].[ФИО], [Employee].[Дата рождения], [Employee].[E-mail], [Department].[Департамент], [Employee].[Телефон] FROM [Employee], [Department] WHERE [Employee].[Департамент]=[Department].[ID];";
                SqlCommand command = new SqlCommand(com, connect);
                SqlDataAdapter dadapter;
                dadapter = new SqlDataAdapter();
                dadapter.SelectCommand = command;
                dtGeneral = new DataTable();
                dadapter.Fill(dtGeneral);
                allEmployeeDataGrid.DataContext = dtGeneral.DefaultView;
                connect.Close();
            }
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            ObnvEmployee();
            ObnvDepartment();
        }
        private void editEmpl_Click(object sender, RoutedEventArgs e)
        {
            if (allEmployeeDataGrid.SelectedItem != null)
            {
                EditEmpl edtempl = new EditEmpl();
                edtempl.allDepComboBox1.ItemsSource = dtDepart.DefaultView;
                DataRowView selectemp = (DataRowView)allEmployeeDataGrid.SelectedItem;             
                var request = dtGeneral
                    .AsEnumerable()
                    .Where(emplID => emplID.Field<int>("ID") == (int)selectemp["ID"]);
                int idemployee;                
                string result = String.Empty;                
                foreach(var item in request)
                {
                    SqlConnection conn1 = new SqlConnection(connectionString);
                    conn1.Open();
                    SqlCommand cmd = conn1.CreateCommand();
                    cmd.CommandText = $"SELECT [ID] FROM [Department] WHERE [Department].[Департамент]='{Convert.ToString(item[4])}';";
                    int resid = ((int)cmd.ExecuteScalar());
                    conn1.Close();
                    result += $"{item[0]}";
                    edtempl.FIOtextBox.Text = Convert.ToString(item[1]);
                    edtempl.edtdatePicker.SelectedDate = (DateTime)item[2];
                    edtempl.MailtextBox.Text = Convert.ToString(item[3]);
                    edtempl.allDepComboBox1.SelectedIndex = resid - 1;
                    edtempl.PhonetextBox.Text = Convert.ToString(item[5]);
                }                
                if (edtempl.ShowDialog() == true)
                {
                    if (Convert.ToString(edtempl.FIOtextBox.Text) != "" && Convert.ToString(edtempl.allDepComboBox1.SelectedValue) != "")
                    {
                        idemployee = Convert.ToInt32(result);
                        string com = $"UPDATE [Employee] SET [ФИО]='{edtempl.FIOtextBox.Text}', [Дата рождения]='{(DateTime)edtempl.edtdatePicker.SelectedDate}', [E-mail]='{edtempl.MailtextBox.Text}', [Департамент]='{edtempl.allDepComboBox1.SelectedIndex + 1}', [Телефон]='{edtempl.PhonetextBox.Text}' WHERE [Employee].[ID]='{idemployee}';";
                        using (SqlConnection connect = new SqlConnection(connectionString))
                        {
                            connect.Open();
                            SqlCommand command = new SqlCommand(com, connect);
                            SqlDataAdapter dataAdapter = new SqlDataAdapter();
                            dataAdapter.SelectCommand = command;
                            dataAdapter.Fill(dtGeneral);
                            connect.Close();
                            ObnvEmployee();
                        }
                    }
                    else
                    {
                        MessageBox.Show("Ошибка! Вы не ввели ФИО сотрудника или не выбрали его Департамент!", "Ошибка Данных!", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
            }
            else
            {
                MessageBox.Show("Ошибка! Вы не выбрали работника для изменения!", "Ошибка Данных!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void addEmpl_Click(object sender, RoutedEventArgs e)
        {
            AddEmployee addEmployee = new AddEmployee();
            addEmployee.addDepComboBox.ItemsSource = dtDepart.DefaultView;
            if (addEmployee.ShowDialog() == true)
            {
                if (addEmployee.FIOtextBox.Text != "" && addEmployee.addDepComboBox.SelectedItem != "")
                {
                    string com = $"INSERT INTO [Employee] ([ФИО], [Дата рождения], [E-mail], [Департамент], [Телефон]) VALUES ('{addEmployee.FIOtextBox.Text}', '{(DateTime)addEmployee.edtdatePicker.SelectedDate}', '{addEmployee.MailtextBox.Text}', '{addEmployee.addDepComboBox.SelectedIndex + 1}', '{addEmployee.PhonetextBox.Text}');";
                    using (SqlConnection connect = new SqlConnection(connectionString))
                    {
                        connect.Open();
                        SqlCommand command = new SqlCommand(com, connect);
                        SqlDataAdapter dataAdapter = new SqlDataAdapter();
                        dataAdapter.SelectCommand = command;
                        dataAdapter.Fill(dtGeneral);
                        ObnvEmployee();
                    }
                }
                else
                {
                    MessageBox.Show("Ошибка! Вы не ввели ФИО нового сотрудника или не выбрали его Департамент!", "Ошибка Данных!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void editDep_Click(object sender, RoutedEventArgs e)
        {
            EditDepartment editDepartment = new EditDepartment();
            if (alldepDataGrid.SelectedItem != null)
            {
                DataRowView selectemp = (DataRowView)alldepDataGrid.SelectedItem;
                string result = String.Empty;
                var request = dtDepart
                    .AsEnumerable()
                    .Where(emplID => emplID.Field<int>("ID") == (int)selectemp["ID"]);
                foreach (var item in request)
                {
                    result += $"{item[0]}";
                    editDepartment.oldName.Content = Convert.ToString(item[1]);
                }
                int index = Convert.ToInt32(result);
                if (editDepartment.ShowDialog() == true)
                {
                    if (editDepartment.newName.Text != "")
                    {
                        string com = $"UPDATE [Department] SET [Департамент]='{editDepartment.newName.Text}' WHERE [Department].[ID]='{index}';";
                        using (SqlConnection connect = new SqlConnection(connectionString))
                        {
                            connect.Open();
                            SqlCommand command = new SqlCommand(com, connect);
                            SqlDataAdapter dataAdapter = new SqlDataAdapter();
                            dataAdapter.SelectCommand = command;
                            dataAdapter.Fill(dtDepart);
                            ObnvEmployee();
                            ObnvDepartment();
                        }
                    }
                    else
                    {
                        MessageBox.Show("Ошибка! Вы не ввели новое название департамента!", "Ошибка Данных!", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                    
                }
            }
            else
            {
                MessageBox.Show("Ошибка! Вы не выбрали Отдел для изменения!", "Ошибка Данных!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void addDep_Click(object sender, RoutedEventArgs e)
        {
            AddDepartment addDepartment = new AddDepartment();
            if (addDepartment.ShowDialog() == true)
            {
                if (addDepartment.addDeptextBox.Text != "")
                {
                    using (SqlConnection connect = new SqlConnection(connectionString))
                    {
                        connect.Open();
                        string com = $"INSERT INTO [Department] ([Департамент]) VALUES ('{addDepartment.addDeptextBox.Text}');";
                        SqlCommand command = new SqlCommand(com, connect);
                        SqlDataAdapter dataAdapter = new SqlDataAdapter();
                        dataAdapter.SelectCommand = command;
                        dataAdapter.Fill(dtDepart);
                        connect.Close();
                        ObnvDepartment();
                    }
                }
                if(addDepartment.addDeptextBox.Text=="")
                {
                    MessageBox.Show("Ошибка! Вы не ввели название нового департамента!", "Ошибка Данных!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}
