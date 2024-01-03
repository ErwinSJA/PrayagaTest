using System.Net;

namespace WebAPI.Prayaga.Commons.Exceptions
{
    public class ExceptionNotFound : CustomException
    {
        public ExceptionNotFound(string message, string pstrHeaderResponse = "")
            : base(message, pstrHeaderResponse, null, HttpStatusCode.NotFound)
        {
        }
    }
}
