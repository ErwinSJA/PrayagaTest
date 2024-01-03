using System.Net;

namespace WebAPI.Prayaga.Commons.Exceptions
{
    public class ExceptionRequestTimeout : CustomException
    {
        public ExceptionRequestTimeout(string message, string pstrHeaderResponse = "")
            : base(message, pstrHeaderResponse, null, HttpStatusCode.RequestTimeout) { }
    }
}
