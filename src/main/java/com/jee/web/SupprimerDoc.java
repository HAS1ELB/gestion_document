package com.jee.web;

import java.io.File;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SupprimerDoc extends Action {

	public SupprimerDoc(com.jee.business.Facade Facade) {
		super(Facade);
	}

	@Override
	String execute(HttpServletRequest req, HttpServletResponse resp) {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			System.out.println("id est:" +id);
			
			System.out.println(facade.listerDoc(id).toString());

			String path2 = facade.listerDoc(id).getPath();
			String path1 = "C:\\Users\\HP\\Desktop\\gestion_document_v3\\gestion_document_v3\\src\\main\\webapp\\";

			String path = path1 + path2;
			System.out.println(path);
	        
	        File file = new File(path);
	        
	        if (file.exists()) {
	            if (file.delete()) {
	                System.out.println("Fichier supprimé avec succès : " + path);
	            } else {
	                System.out.println("Échec de la suppression du fichier : " + path);            
	            }
            } else { 
	            System.out.println("Le fichier n'existe pas : " + path);
            }
	        
			facade.supprimerDoc(id);
			String username =req.getParameter("username");
			req.setAttribute("ld", facade.listerDocs(username));	
			req.setAttribute("username", username);
			req.setAttribute("message", "Document supprimé");
			return "/views/voirDocsUser.jsp";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "muchkila";
		}

	}

}
