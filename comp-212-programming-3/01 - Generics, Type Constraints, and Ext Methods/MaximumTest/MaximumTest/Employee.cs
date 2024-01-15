using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MaximumTest
{
    public class Employee  : IComparable<Employee>  
    {
        public Employee(string name, decimal salary)
        {
            this.Name = name;
            this.Salary = salary;
        }

        public string Name { get; }
        public decimal Salary { get; private set; }

        public override string ToString() => $"{Name}, {Salary:C}";

        public static bool CompareSalary(Employee e1, Employee e2) =>
          e1.Salary < e2.Salary;

        public int CompareTo(Employee e)
        {
            if (Salary < e.Salary) return -1;
            else if (Salary == e.Salary) return 0;
                    return 1;
        }
    }
}
