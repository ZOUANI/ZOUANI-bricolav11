/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Secteur;
import bean.Ville;
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
public class SecteurFacade extends AbstractFacade<Secteur> {

    @PersistenceContext(unitName = "bricolagePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    @Override
    public void edit(Secteur secteur){
        if(secteur.getId()==null || secteur.getId()<0){
            secteur.setId(generateId("Secteur", "id"));
        }
        super.edit(secteur);
    }

    public SecteurFacade() {
        super(Secteur.class);
    }

    public List<Secteur> findByVille(Ville ville) {

        String requette = "select s from Secteur s where 1=1";
        if (ville != null) {
            requette += SearchUtil.addConstraint("s", "ville.nom", "=", ville.getNom());
        }
        System.out.println("requette = " + requette);
        return getMultipleResult(requette);

    }
    

}
