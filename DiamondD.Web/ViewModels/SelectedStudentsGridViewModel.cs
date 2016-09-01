using Lib.Web.Mvc.JQuery.JqGrid.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DiamondD.Web.ViewModels
{
    public class SelectedStudentsGridViewModel
    {
        [HiddenInput(DisplayValue = false)]
        public int StudentId { get; set; }
        [HiddenInput(DisplayValue = false)]      
        public int EnrollmentId { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
    }
}
