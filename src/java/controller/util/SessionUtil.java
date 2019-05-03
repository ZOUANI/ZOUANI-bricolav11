package controller.util;

import bean.Client;
import java.io.IOException;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

public class SessionUtil {

    private static final SessionUtil instance = new SessionUtil();

    private SessionUtil() {
    }

    public static void remove(String cle) {
        FacesContext fc = FacesContext.getCurrentInstance();
        if (fc != null && fc.getExternalContext() != null) {
            getSession(fc).removeAttribute(cle);
        }
    }

    public static void registerClient(Client user) {
        //clone user before
        setAttribute("user", user);
    }

    public static Client getConnectedClient() {
        return (Client) getAttribute("user");
    }

    public static void setAttribute(String cle, Object valeur) {
        FacesContext fc = FacesContext.getCurrentInstance();
        if (fc != null && fc.getExternalContext() != null) {
            getSession(fc).setAttribute(cle, valeur);
        }
    }

    private static HttpSession getSession(FacesContext fc) {
        return (HttpSession) fc.getExternalContext().getSession(false);
    }

    public static Object getAttribute(String cle) {
        FacesContext fc = FacesContext.getCurrentInstance();
        Object res = null;
        if (isContextOk(fc)) {
            res = getSession(fc).getAttribute(cle);
        }
        return res;
    }

    private static boolean isContextOk(FacesContext fc) {
        boolean res = (fc != null
                && fc.getExternalContext() != null
                && fc.getExternalContext().getSession(false) != null);
        return res;
    }

    public static void redirect(String pagePath) throws IOException {
//        if (!pagePath.endsWith(".xhtml")) {
//            pagePath += ".xhtml";
//        }
        FacesContext.getCurrentInstance().getExternalContext().redirect(pagePath);

    }

    public static HttpSession getSession() {
        return (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
    }

    public static void showConnexionMessage(int conected) {
        String message = null;
        if (conected == -6) {
            message = "login ne peut pas etre vide";
        } else if (conected == -5) {
            message = "adresse email invalide";
        } else if (conected == -4) {
            message = "login introuvable";
        } else if (conected == -3) {
            message = "passsword errone et le user est bloqué";
        } else if (conected == -2) {
            message = "passsword errone ";
        } else if (conected == -1) {
            message = "le user est déjà bloqué";
        } else if (conected == 1) {
            message = "Bien venu :)";
        }
        if (conected > 0) {
            JsfUtil.addSuccessMessage(message);
        } else {
            JsfUtil.addErrorMessage(message);
        }
    }
}
