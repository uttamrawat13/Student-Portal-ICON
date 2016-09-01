using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Lib.Web.Mvc.JQuery.JqGrid.DataAnnotations;
using Lib.Web.Mvc.JQuery.JqGrid;
using System.ComponentModel;
using System.Web.Mvc;

namespace DiamondD.Web.ViewModels
{
    public class SurveyGridViewModel
    {
        [JqGridColumnLayout(Alignment = JqGridAlignments.Left)]
        public string Name { get; set; }
        [JqGridColumnFormatter("$.dateFormater")]        
        [JqGridColumnLayout(Alignment = JqGridAlignments.Center, Width = 100 )]
        public DateTime? OpenDate { get; set; }
        [JqGridColumnLayout(Alignment = JqGridAlignments.Center, Width = 50)]
        public char Active { get; set; }
        [DisplayName("Edit")]
        [JqGridColumnFormatter("$.EditFormater")]
        [JqGridColumnLayout(Alignment = JqGridAlignments.Center, Width=100)]
        public int Id { get; set; }
    }
}
