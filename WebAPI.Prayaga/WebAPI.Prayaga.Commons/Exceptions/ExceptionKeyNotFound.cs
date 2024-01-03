using System.Net;

namespace WebAPI.Prayaga.Commons.Exceptions
{
    public class ExceptionKeyNotFound : CustomException
    {
        public ExceptionKeyNotFound(string message, string pstrHeaderResponse = "") 
            : base(message, pstrHeaderResponse, null, HttpStatusCode.Unauthorized) { }
    }
}
