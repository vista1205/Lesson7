using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Lesson7
{
    /// <summary>
    /// Логика взаимодействия для EditEmpl.xaml
    /// </summary>
    public partial class EditEmpl : Window
    {
        public EditEmpl()
        {
            InitializeComponent();
            this.PhonetextBox.PreviewTextInput += PhonetextBox_PreviewTextInput;
            this.FIOtextBox.PreviewTextInput += FIOtextBox_PreviewTextInput;
            this.edtdatePicker.PreviewTextInput += EdtdatePicker_PreviewTextInput;
        }

        private void EdtdatePicker_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9.]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void FIOtextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsLetter(e.Text, 0)) e.Handled = true;
        }

        private void PhonetextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0)) e.Handled = true;
        }

        private void saveButton_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = true;
        }

        private void cancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = false;
        }

    }
}
