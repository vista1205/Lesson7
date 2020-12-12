using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lesson7
{
    public class Employee
    {
       public int ID { get; set; }
       public string FIO { get; set; }
       public string MAIL { get; set; }
       public string PHONE { get; set; }
       public Departments Department { get; set; }
    }
}
