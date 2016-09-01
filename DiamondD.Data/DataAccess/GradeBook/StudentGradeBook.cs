using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.GradeBook
{
    public class StudentGradeBook
    {
        public IList<GradeBookInfo> studentGradeBook { get; private set; }

        public string StudentName
        {
            get
            {
                if (studentGradeBook != null)
                    return studentGradeBook[0].Student;
                return null;
            }
        }

        public StudentGradeBook() : this(null)
        { 
        }

        public StudentGradeBook(IList<GradeBookInfo> StudentGradeBook)
        {
            this.studentGradeBook = StudentGradeBook;
        }

    }
}
