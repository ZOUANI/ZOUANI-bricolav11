package controller;

import bean.VoitureMarque;
import bean.VoitureModele;
import controller.util.JsfUtil;
import controller.util.JsfUtil.PersistAction;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import service.VoitureModeleFacade;

@Named("voitureModeleController")
@SessionScoped
public class VoitureModeleController implements Serializable {

    @EJB
    private service.VoitureModeleFacade ejbFacade;
    private List<VoitureModele> items = null;
    private VoitureModele selected;
    private VoitureMarque voitureMarqueSearch;

    public void searchByMarque() {
        items = ejbFacade.searchByMarque(getVoitureMarqueSearch());
    }
    private List<VoitureModele> voitureModeles;

    public void reomve(VoitureModele voitureModele) {
        ejbFacade.reomve(voitureModele, voitureModeles);
    }

    public void add() {
        ejbFacade.create(getSelected(), getVoitureModeles());
        System.out.println("getVoitureModeles() = " + getVoitureModeles());
        selected = null;
    }

    public void save() {
        ejbFacade.create(getSelected().getMarque(), getVoitureModeles());
        selected = null;
        voitureModeles = null;
    }

    public VoitureModeleController() {
    }

    public List<VoitureModele> getVoitureModeles() {
        if (voitureModeles == null) {
            voitureModeles = new ArrayList<>();
        }
        return voitureModeles;
    }

    public void setVoitureModeles(List<VoitureModele> voitureModeles) {
        this.voitureModeles = voitureModeles;
    }

    public VoitureModele getSelected() {
        if (selected == null) {
            selected = new VoitureModele();
        }
        return selected;
    }

    public void setSelected(VoitureModele selected) {
        this.selected = selected;
    }

    protected void setEmbeddableKeys() {
    }

    protected void initializeEmbeddableKey() {
    }

    private VoitureModeleFacade getFacade() {
        return ejbFacade;
    }

    public VoitureModele prepareCreate() {
        selected = new VoitureModele();
        selected.setMarque(getVoitureMarqueSearch());
        initializeEmbeddableKey();
        return selected;
    }

    public void create() {
        persist(PersistAction.CREATE, ResourceBundle.getBundle("/Bundle").getString("VoitureModeleCreated"));
        if (!JsfUtil.isValidationFailed()) {
            searchByMarque();    // Invalidate list of items to trigger re-query.
        }
    }

    public void update() {
        persist(PersistAction.UPDATE, ResourceBundle.getBundle("/Bundle").getString("VoitureModeleUpdated"));
    }

    public void destroy() {
        persist(PersistAction.DELETE, ResourceBundle.getBundle("/Bundle").getString("VoitureModeleDeleted"));
        if (!JsfUtil.isValidationFailed()) {
            selected = null; // Remove selection
            searchByMarque();    // Invalidate list of items to trigger re-query.
        }
    }

    public List<VoitureModele> getItems() {
        if (items == null) {
            items = getFacade().findAll();
        }
        return items;
    }

    private void persist(PersistAction persistAction, String successMessage) {
        if (selected != null) {
            setEmbeddableKeys();
            try {
                if (persistAction == PersistAction.CREATE) {
                    getFacade().create(selected);
                } else if (persistAction == PersistAction.UPDATE) {
                    getFacade().edit(selected);
                } else {
                    getFacade().remove(selected);
                }
                JsfUtil.addSuccessMessage(successMessage);
            } catch (EJBException ex) {
                String msg = "";
                Throwable cause = ex.getCause();
                if (cause != null) {
                    msg = cause.getLocalizedMessage();
                }
                if (msg.length() > 0) {
                    JsfUtil.addErrorMessage(msg);
                } else {
                    JsfUtil.addErrorMessage(ex, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
                }
            } catch (Exception ex) {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, ex);
                JsfUtil.addErrorMessage(ex, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            }
        }
    }

    public VoitureModele getVoitureModele(java.lang.Long id) {
        return getFacade().find(id);
    }

    public List<VoitureModele> getItemsAvailableSelectMany() {
        return getFacade().findAll();
    }

    public List<VoitureModele> getItemsAvailableSelectOne() {
        return getFacade().findAll();
    }

    @FacesConverter(forClass = VoitureModele.class)
    public static class VoitureModeleControllerConverter implements Converter {

        @Override
        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            VoitureModeleController controller = (VoitureModeleController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "voitureModeleController");
            return controller.getVoitureModele(getKey(value));
        }

        java.lang.Long getKey(String value) {
            java.lang.Long key;
            key = Long.valueOf(value);
            return key;
        }

        String getStringKey(java.lang.Long value) {
            StringBuilder sb = new StringBuilder();
            sb.append(value);
            return sb.toString();
        }

        @Override
        public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
            if (object == null) {
                return null;
            }
            if (object instanceof VoitureModele) {
                VoitureModele o = (VoitureModele) object;
                return getStringKey(o.getId());
            } else {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "object {0} is of type {1}; expected type: {2}", new Object[]{object, object.getClass().getName(), VoitureModele.class.getName()});
                return null;
            }
        }

    }

    public VoitureMarque getVoitureMarqueSearch() {
        if (voitureMarqueSearch == null) {
            voitureMarqueSearch = new VoitureMarque();
        }
        return voitureMarqueSearch;
    }

    public void setVoitureMarqueSearch(VoitureMarque voitureMarqueSearch) {
        this.voitureMarqueSearch = voitureMarqueSearch;
    }

}
