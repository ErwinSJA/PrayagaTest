using System.Net;

namespace WebAPI.Prayaga.Commons.Exceptions
{
    public class ExceptionUnauthorizedAccess : CustomException
    {
        public ExceptionUnauthorizedAccess(string pstrMensaje, string pstrHeaderResponse = "")
            : base(pstrMensaje, pstrHeaderResponse, null, HttpStatusCode.Unauthorized) { }
    }
}
