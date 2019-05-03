/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.DemandeServiceConfirmationDetail;
import bean.Device;
import bean.Manager;
import bean.StatistiqueGenerale;
import bean.User;
import java.util.List;
import controller.util.*;
import java.math.BigDecimal;
import java.util.Date;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Ashen One
 */

public class UserFacade extends AbstractFacade<User> {

    @EJB
    DemandeServiceFacade demandeServiceFacade;
    @EJB
    WorkerFacade workerFacade;

    @PersistenceContext(unitName = "bricolagePU")
    private EntityManager em;

//    public int login(Manager manager) {
//
//        Manager m = (Manager) em.createQuery("SELECT m FROM Manager m WHERE m.login='" + manager.getLogin() + "'").getSingleResult();
//        if (m == null) {
//            return -1;
//        } else if (m.isBlocked()) {
//            return -2;
//        } else if (!m.getPassword().equals(manager.getPassword())) {
//            return -3;
//        } else {
//            return 1;
//
//        }
//    }
    public int seConnnecter(User user) {
        if (user == null || user.getLogin() == null) {
            return -6;
        }else if(EmailUtil.emailValidate(user.getLogin())){
            return -5;
        } 
        else {
            //Trouver utilisateur en fonction du login
            User loadedUser = find(user.getLogin());
            if (loadedUser == null) {
                return -4;
                //Verification du Mot de passe
            } else if (!loadedUser.getPassword().equals(HashageUtil.sha256(user.getPassword()))) {
                //Nombre de connexions
                if (loadedUser.getNbrCnx() < 3) {
                } else if (loadedUser.getNbrCnx() >= 3) {
                    loadedUser.setBlocked(true);
                    edit(user);
                    return -3;
                }
                return -2;
                //Verifier si l'utilisateur est bloqué
            } else if (loadedUser.isBlocked()) {
                return -1;
            } else {
                loadedUser.setNbrCnx(0);
                User myClone = clone(loadedUser);
//                myClone.setPassword(null);
                SessionUtil.setAttribute("connectedManager", myClone);
                return 1;
            }

        }
    }

    public void seDeConnnecter() {
        SessionUtil.getSession().invalidate();

    }

    public int RepDernConx(Manager manager, Date dernierDate) {
        String dernierConex = DateUtil.formateDate("yyyy-MM-dd", dernierDate);
        List<Device> device = em.createQuery("SELECT d FROM Device d WHERE "
                + " d.manager.login='" + manager.getLogin() + "' ORDER BY d.dateConnection DESC").getResultList();
        if (DateUtil.formateDate("yyyy-MM-dd", device.get(0).getDateConnection()).equals(dernierConex)) {
            return 1;
        }
        return 0;
    }

    public int RepDernAction(Manager manager, String action) {

        List<DemandeServiceConfirmationDetail> demandes = em.createQuery("SELECT d FROM DemandeServiceConfirmationDetail d WHERE "
                + " d.manager.login='" + manager.getLogin() + "' ORDER BY d.dateAction DESC").setMaxResults(1).getResultList();
        if (demandes.isEmpty()) {
            System.out.println("type empty");
        } else if (demandes.get(0).getTypeAction().getName().equals(action)) {
            return 1;
        }
        System.out.println(demandes.get(0).getTypeAction().getName());
        return 0;
    }

    public int RepDernConfir(Manager manager, Date dernierDate) {

        String dernierConfirmation = DateUtil.formateDate("yyyy-MM-dd", dernierDate);
        List<DemandeServiceConfirmationDetail> demandes = em.createQuery("SELECT d FROM DemandeServiceConfirmationDetail d WHERE "
                + " d.manager.login='" + manager.getLogin() + "' AND d.typeAction.name='confirmation' ORDER BY d.dateAction DESC").setMaxResults(1).getResultList();
        if (demandes.isEmpty()) {
            System.out.println("confir empty");
            return 0;
        } else if (DateUtil.formateDate("yyyy-MM-dd", demandes.get(0).getDateAction()).equals(dernierConfirmation)) {
            return 1;
        }
        return 0;
    }

    public BigDecimal[] genererStatistique(String service, StatistiqueGenerale statistiqueGenerale, int equipement) {
        BigDecimal[] statistique = new BigDecimal[12];
        for (int i = 1; i <= 12; i++) {
            statistique[i - 1] = statistiqueParMois(service, statistiqueGenerale, equipement, i);
        }
        return statistique;

    }

    private BigDecimal statistiqueParMois(String service, StatistiqueGenerale statistiqueGenerale, int equipement, int i) {
        String type;
        if (statistiqueGenerale.getPrix() == 2) {
            type = "prixTtc";
        } else {
            type = "prixHt";
        }
        String requette = checkCriteriaByService(service, type, equipement, i);

        //String requette = "SELECT SUM(ds."+type+") FROM DemandeService ds WHERE ds.service.nom = "+service+" AND FUNCTION('MONTH', ds.datedemande) = '"+i+"'";
        if (statistiqueGenerale.getAnnee() > 0) {
            requette += " AND FUNCTION('YEAR', ds.datedemande) = '" + statistiqueGenerale.getAnnee() + "'";
        }
        if (statistiqueGenerale.getDateMin() != null) {
            requette += " AND ds.datedemande >= '" + DateUtil.getSqlDateTime(statistiqueGenerale.getDateMin()) + "'";
        }
        if (statistiqueGenerale.getDateMax() != null) {
            requette += " AND ds.datedemande <= '" + DateUtil.getSqlDateTime(statistiqueGenerale.getDateMax()) + "'";
        }
        if (statistiqueGenerale.getWorker() != null && statistiqueGenerale.getWorker().getLogin() != null) {
            requette += " AND ds.worker.login = '" + statistiqueGenerale.getWorker().getLogin() + "'";
        }
        if (statistiqueGenerale.getService() != null && statistiqueGenerale.getService().getId() != null) {
            requette += " AND ds.service.id = '" + statistiqueGenerale.getService().getId() + "'";
        }
        if (statistiqueGenerale.getVille() != null && statistiqueGenerale.getVille().getId() != null) {
            requette += " AND ds.secteur.ville.id='" + statistiqueGenerale.getVille().getId() + "'";
        }
        if (statistiqueGenerale.getSecteur() != null && statistiqueGenerale.getSecteur().getId() != null) {
            requette += " AND ds.secteur.id='" + statistiqueGenerale.getSecteur().getId() + "'";
        }
        if (statistiqueGenerale.getConfirmation() == 1) {
            requette += " AND ds.dateConfirmation != NULL";
        }
        if (statistiqueGenerale.getConfirmation() == 2) {
            requette += " AND ds.dateConfirmation = NULL";
        }
        List<BigDecimal> res = em.createQuery(requette).getResultList();
        if (res != null && !res.isEmpty() && res.get(0) != null) {
            return res.get(0);
        }
        return new BigDecimal(0);
    }

    private String checkCriteriaByService(String service, String type, int equipement, int i) {
        String requette = "SELECT SUM(ds." + type + ") FROM DemandeService ds";
        String requetteComplement = "FUNCTION('MONTH', ds.datedemande) = '" + i + "'";
        if (service != null) {
            String requetteService = "WHERE ds.service.nom = '" + service + "'";
            if (service.equals("nettoyageMaison")) {
                requette += ", DemandeCleaning dc " + requetteService + " AND " + requetteComplement + "";
                if (equipement == 1) {
                    requette += " AND dc.bringEquipement = '1'";
                }
                if (equipement == 2) {
                    requette += " AND dc.bringEquipement = '0'";
                }
            }
        } else {
            requette += " WHERE " + requetteComplement + "";
        }
        return requette;
    }

    public int numberWorkers() {
        return workerFacade.findAll().size();
    }

    public int numberDemandes() {
        return demandeServiceFacade.findNumberOfNewDemandes();
    }

    public BigDecimal profitAnnuelle() {
        return demandeServiceFacade.profitAnnuelle();
    }

    public void changeMdp(Manager manager, String mdp) {
        User m = find(manager.getLogin());
        m.setPassword(mdp);
        edit(m);
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UserFacade() {
        super(User.class);
    }

    private Manager clone(User user) {
        Manager myClone = new Manager();
        myClone.setLogin(user.getLogin());
       // myClone.setDevices(user.getDevices());
        myClone.setBlocked(user.isBlocked());
        myClone.setNbrCnx(user.getNbrCnx());
        myClone.setNom(user.getNom());
        myClone.setPassword(user.getPassword());
        myClone.setPhone(user.getPhone());
      //  myClone.setPrenom(user.getPrenom());
        return myClone;
    }

}
