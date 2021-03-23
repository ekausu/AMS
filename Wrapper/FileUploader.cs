using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AdvanceSystem.Wrapper
{
    public class FileUploader
    {
        public byte[] Image { get; set; }
        public string ContentType { get; set; }
        public string FileName { get; set; }
        public string Extension { get; set; }
        public int Id { get; set; }
    }
}