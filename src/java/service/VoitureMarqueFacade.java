/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.VoitureMarque;
import bean.VoitureModele;
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
public class VoitureMarqueFacade extends AbstractFacade<VoitureMarque> {

    @PersistenceContext(unitName = "bricolagePU")
    private EntityManager em;

    @EJB
    private VoitureModeleFacade voitureModeleFacade;

    public void create(VoitureMarque marque, List<VoitureModele> voitureModeles) {
        marque.setId(generateId("VoitureMarque", "id"));
        create(marque);
        voitureModeleFacade.create(marque, voitureModeles);
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public VoitureMarqueFacade() {
        super(VoitureMarque.class);
    }

}
