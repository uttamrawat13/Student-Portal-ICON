using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Lib.Web.Mvc.JQuery.JqGrid.DataAnnotations;
using Lib.Web.Mvc.JQuery.JqGrid;

namespace DiamondD.Web.ViewModels
{
    public class SurveyStudentGridViewModel 
    {
        [HiddenInput(DisplayValue = false)]
        public int SurveyStudentId { get; set; }        
        [JqGridColumnLayout(Alignment = JqGridAlignments.Left)]
        public string LastName { get; set; }
        [JqGridColumnLayout(Alignment = JqGridAlignments.Left)]
        public string FirstName { get; set; }
        [HiddenInput(DisplayValue = false)]
        public int EnrollmentId { get; set; }
        [JqGridColumnFormatter("$.dateFormater")]
        public DateTime StartDate { get; set; }
        public string Status { get; set; }
        public string Program { get; set; }
    }
}
