using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lesson7
{
    public class Employee
    {
        int _ID;
        string _FIO;
        DateTime _BIRTH;
        string _MAIL;
        string _PHONE;
        Departments _Department;        
        public int ID
        {
            get { return _ID; }
            set { _ID = value; }
        }
        public string FIO
        {
            get { return _FIO; }
            set { _FIO = value; }
        }
        public DateTime BIRTH
        {
            get { return _BIRTH; }
            set { _BIRTH = value; }
        }
        public string MAIL
        {
            get { return _MAIL; }
            set { _MAIL = value; }
        }
        public string PHONE
        {
            get { return _PHONE; }
            set { _PHONE = value; }
        }
        public Departments Department
        {
            get { return _Department; }
            set { _Department = value; }
        }
    }
}
