﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Common;

namespace DiamondD.Services.Common
{
    public interface ICommonService
    {
        IList<Course> GetCourses(bool fetchActiveOnly = true);
        IList<Session> GetSessions(bool fetchActiveOnly = true);
        IList<StudentStatus> GetStudentStatusList(bool fetchActiveOnly = true);
        IList<Program> GetPrograms(bool fetchActiveOnly = true);
        IList<Term> GetTerms();
        IList<StudentGroup> GetStudentGroups(bool fetchActiveOnly = true);
    }
}
