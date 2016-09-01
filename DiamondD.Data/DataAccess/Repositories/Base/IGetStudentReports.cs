using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Report;

namespace DiamondD.Data.DataAccess.Repositories.Base
{
    public interface IGetStudentReports : IBaseRepository
    {
        Student1098TReport GetStudent1098TPdf(int studentNo);
    }
}
