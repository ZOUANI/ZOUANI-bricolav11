/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Carburant;
import bean.Couleur;
import bean.Ville;
import bean.Voiture;
import bean.VoitureMarque;
import bean.VoitureModele;
import bean.Worker;
import controller.util.SearchUtil;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Ashen One
 */
@Stateless
public class VoitureFacade extends AbstractFacade<Voiture> {

    @PersistenceContext(unitName = "bricolagePU")
    private EntityManager em;

    @EJB
    private WorkerFacade workerFacade;

    @EJB
    private WorkerJobFacade workerJobFacade;

    @EJB
    private ServiceFacade serviceFacade;
    @EJB
    private SecteurFacade secteurFacade;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public VoitureFacade() {
        super(Voiture.class);
    }

    public List<Voiture> findByWorker(Worker worker) {
        return getMultipleResult("SELECT v from Voiture v where v.worker.login='" + worker.getLogin() + "'");
    }

    public int save(Worker worker, List<Voiture> voitures) {
        worker.setAccepted(true);
        workerFacade.creerCompte(worker);
        workerJobFacade.create(worker, serviceFacade.find(21L), worker.getSecteur());
        for (int i = 0; i < voitures.size(); i++) {
            saveVoiture(voitures.get(i), worker);
        }
        return 1;
    }

    public void saveVoiture(Voiture v, Worker worker) {
        v.setWorker(worker);
        if (v.getId() == null || v.getId() < 0) {
            v.setId(generateId("Voiture", "id"));
        }
        edit(v);
    }

//     public int editoiture(Voiture voiture, List<Voiture> voitures) {
//          int index = findByIndex(voiture, voitures);
//        if (index != -1) {
//            voitures.set(index);
//            if (voiture.getId() != null && voiture.getId() > 0) {
//                remove(voiture);
//            }
//        }
//        return 1;
//     }
    public int addOrEditVoiture(Voiture voiture, List<Voiture> voitures) {
        int index = findByIndex(voiture, voitures);
        if (voiture.getId() == null) {
            voiture.setId(new Long((-1) * (voitures.size() + 1)));
        }
        Voiture myClone = clone(voiture);

        if (index == -1) {
            voitures.add(myClone);
        } else {
            voitures.set(index, myClone);
        }
        return 1;
    }

    public int deleteVoiture(Voiture voiture, List<Voiture> voitures) {
        int index = findByIndex(voiture, voitures);
        if (index != -1) {
            voitures.remove(index);
            if (voiture.getId() != null && voiture.getId() > 0) {
                remove(voiture);
            }
        }
        return 1;
    }

    private Voiture clone(Voiture voiture) {
        Voiture myClone = new Voiture();
        myClone.setId(voiture.getId());
        myClone.setCarburant(voiture.getCarburant());
        myClone.setModele(voiture.getModele());
        myClone.setPrix(voiture.getPrix());
        myClone.setQuantite(voiture.getQuantite());
        myClone.setWorker(voiture.getWorker());
        myClone.setImageVoitures(voiture.getImageVoitures());
        return myClone;
    }

    private int findByIndex(Voiture voiture, List<Voiture> voitures) {
        for (int i = 0; i < voitures.size(); i++) {
            Voiture item = voitures.get(i);
            if (item.getCarburant().equals(voiture.getCarburant()) && item.getModele().equals(voiture.getModele())) {
                return i;
            }
        }
        return -1;
    }

    public List<Voiture> findByModel(VoitureModele modele) {

        String requette = "select v from Voiture v where v.modele.id = '" + modele.getId() + "'";
        System.out.println("requette : " + requette);

        return em.createQuery(requette).getResultList();

    }

    public List<Voiture> findByCriteria(VoitureMarque voitureMarque, VoitureModele modele, Carburant carburant,Ville ville) {
        String query = constructQuery(voitureMarque, modele, carburant,ville,null);
        return getMultipleResult(query);

    }

     public List<Voiture> findByCriteria(VoitureMarque voitureMarque, VoitureModele modele, Carburant carburant,Worker worker) {
        String query = constructQuery(voitureMarque, modele, carburant,worker);
        return getMultipleResult(query);

    }
    public List<Voiture> findByCriteria(VoitureModele modele, Couleur couleur, Carburant carburant) {

        String requette = "select distinct vco.voiture from VoitureCarburant vca, VoitureCouleur vco where vca.voiture.modele.id = '" + modele.getId() + "' and vco.voiture.id = vca.voiture.id";
        if (couleur != null && couleur.getId() != null) {
            requette += " and vco.couleur.id = '" + couleur.getId() + "'";
        }
        if (carburant != null && carburant.getId() != null) {
            requette += " and vca.carburant.id = '" + carburant.getId() + "'";
        }

        System.out.println("hahiya requette : " + requette);
        List<Voiture> voitures = em.createQuery(requette).getResultList();

        if (!voitures.isEmpty()) {
            return voitures;
        } else {
            return new ArrayList<>();
        }

    }

    private String constructQuery(VoitureMarque voitureMarque, VoitureModele modele, Carburant carburant, Worker worker) {
        String query = constructQuery(voitureMarque, modele, carburant);
        if (worker != null) {
            query += SearchUtil.addConstraint("vo", "worker.login", "=", worker.getLogin());
        }
        return query;
    }
    private String constructQuery(VoitureMarque voitureMarque, VoitureModele modele, Carburant carburant, Ville ville,Worker worker) {
        String query = constructQuery(voitureMarque, modele, carburant);
        if (worker != null) {
            query += SearchUtil.addConstraint("vo", "worker.login", "=", worker.getLogin());
        }
        if (ville != null) {
            query += SearchUtil.addConstraint("vo", "worker.secteur.ville.id", "=", ville.getId());
        }
        return query;
    }

    private String constructQuery(VoitureMarque voitureMarque, VoitureModele modele, Carburant carburant) {
        String query = "SELECT distinct vo FROM Voiture vo WHERE 1=1";
        if (voitureMarque != null) {
            query += SearchUtil.addConstraint("vo", "modele.marque.id", "=", voitureMarque.getId());
        }
        if (modele != null) {
            query += SearchUtil.addConstraint("vo", "modele.id", "=", modele.getId());
        }
        if (carburant != null) {
            query += SearchUtil.addConstraint("vo", "carburant.id", "=", carburant.getId());
        }
        System.out.println("query = " + query);
        return query;
    }
}
