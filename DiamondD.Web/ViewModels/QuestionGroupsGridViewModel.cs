using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using Lib.Web.Mvc.JQuery.JqGrid.DataAnnotations;
using Lib.Web.Mvc.JQuery.JqGrid;

namespace DiamondD.Web.ViewModels
{
    public class QuestionGroupsGridViewModel
    {
        [DisplayName("Question Group")]
        [JqGridColumnLayout(Alignment = JqGridAlignments.Left)]
        public string Code { get; set; }
        [JqGridColumnLayout(Alignment = JqGridAlignments.Center, Width=50)]
        public char Active { get; set; }
        [JqGridColumnFormatter("$.EditFormater")]
        [JqGridColumnLayout(Alignment = JqGridAlignments.Center, Width = 100)]
        public int GroupId { get; set; }
    }
}