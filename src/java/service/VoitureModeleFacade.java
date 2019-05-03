/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.VoitureMarque;
import bean.VoitureModele;
import controller.util.SearchUtil;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Ashen One
 */
@Stateless
public class VoitureModeleFacade extends AbstractFacade<VoitureModele> {

    @PersistenceContext(unitName = "bricolagePU")
    private EntityManager em;

    @Override
    public void create(VoitureModele voitureModele) {
        voitureModele.setId(generateId("VoitureModele", "id"));
        super.create(voitureModele);
    }

    public List<VoitureModele> searchByMarque(VoitureMarque marque) {
        String requette = "SELECT vm FROM VoitureModele vm WHERE 1=1";
        if (marque != null) {
            requette += SearchUtil.addConstraint("vm", "marque.id", "=", marque.getId());
        }
        return getMultipleResult(requette);
    }

    public int reomve(VoitureModele voitureModele, List<VoitureModele> voitureModeles) {
        int index = findByIndex(voitureModele, voitureModeles);
        if (index != -1) {
            voitureModeles.remove(voitureModele);
            return 1;
        }
        return -1;
    }

    public int create(VoitureModele voitureModele, List<VoitureModele> voitureModeles) {
        int index = findByIndex(voitureModele, voitureModeles);
        if (index == -1) {
            if (voitureModele.getId() == null) {
                voitureModele.setId(new Long((voitureModeles.size() + 1) * (-1)));
            }
            System.out.println("voitureModele > " + voitureModele);
            voitureModeles.add(clone(voitureModele));
            System.out.println("voitureModeles = " + voitureModeles);
            return 1;
        }
        return -1;
    }

    public void create(VoitureMarque marque, List<VoitureModele> voitureModeles) {
        for (VoitureModele voitureModele : voitureModeles) {
            if (voitureModele.getId() == null || voitureModele.getId() < 0) {
                voitureModele.setId(generateId("VoitureModele", "id"));
            }
            voitureModele.setMarque(marque);
            create(voitureModele);
        }
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public VoitureModeleFacade() {
        super(VoitureModele.class);
    }

    private VoitureModele clone(VoitureModele voitureModele) {
        VoitureModele nyClone = new VoitureModele();

        nyClone.setId(voitureModele.getId());
        nyClone.setAnnee(voitureModele.getAnnee());
        nyClone.setMarque(voitureModele.getMarque());
        nyClone.setNom(voitureModele.getNom());
        return nyClone;
    }

    private int findByIndex(VoitureModele voitureModele, List<VoitureModele> voitureModeles) {
        for (int i = 0; i < voitureModeles.size(); i++) {
            VoitureModele v = voitureModeles.get(i);
            if (v.getMarque().equals(voitureModele.getMarque()) && v.getAnnee().equals(voitureModele.getAnnee())) {
                return i;
            }
        }
        return -1;
    }

}
