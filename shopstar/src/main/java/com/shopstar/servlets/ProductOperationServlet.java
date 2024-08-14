package com.shopstar.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.shopstar.dao.CategoryDao;
import com.shopstar.dao.ProductDao;
import com.shopstar.entities.Category;
import com.shopstar.entities.Product;
import com.shopstar.helper.FactoryProvide;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductOperationServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		
		
		PrintWriter out = response.getWriter();
//		fatching category data
		String op = request.getParameter("operation");

//		add category
		if (op.trim().equals("addcategory")) {

			String tital = request.getParameter("catTitle");
			String disc = request.getParameter("catDesc");
			Category category = new Category(tital, disc);

//		category save in database
			CategoryDao categoryDao = new CategoryDao(FactoryProvide.getFactory());
			int catId = categoryDao.saveCategory(category);
			out.println("category added");

//		messegae send 
			if (catId == -1) {
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Category already exists: " + category.getCategoryTital());
				response.sendRedirect("admin.jsp");
				return;
			}else {
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Category added successfully : " + catId);
			response.sendRedirect("admin.jsp");
			return;}
		}

//		add product 
		else if (op.trim().equals("addproduct")) {

			String pName = request.getParameter("pName");
			String pDesc = request.getParameter("pDesc");
			int pPrice = Integer.parseInt(request.getParameter("pPrice"));
			int pDisc = Integer.parseInt(request.getParameter("pDisc"));
			int pQuan = Integer.parseInt(request.getParameter("pQuan"));
			int catId = Integer.parseInt(request.getParameter("catId"));
			Part part = request.getPart("pPic");

			Product p = new Product();
			p.setpName(pName);
			p.setpDisc(pDesc);
			p.setpPrice(pPrice);
			p.setPdiscount(pDisc);
			p.setpQuantity(pQuan);
			p.setpPhoto(part.getSubmittedFileName());

			CategoryDao cdao = new CategoryDao(FactoryProvide.getFactory());
			Category categoryById = cdao.getCategoryById(catId);
			p.setCategory(categoryById);

//		save product 

			ProductDao pDao = new ProductDao(FactoryProvide.getFactory());
			pDao.saveProduct(p);


			String uploadPath = getServletContext().getRealPath("") + File.separator + "img" + File.separator+ "products";
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists())
				uploadDir.mkdir();

			String fileName = part.getSubmittedFileName();
			String filePath = uploadPath + File.separator + fileName;

			try (FileOutputStream fos = new FileOutputStream(filePath); InputStream is = part.getInputStream()) {
				byte[] buffer = new byte[1024];
				int bytesRead;
				while ((bytesRead = is.read(buffer)) != -1) {
					fos.write(buffer, 0, bytesRead);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}

	
////		pic upload 
////		find out the path to upload photo 
//		String path = request.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
//		System.out.println(path);
//		
////		uploading code
//		try {
//			FileOutputStream fos = new FileOutputStream(path);
//			InputStream is = part.getInputStream();
//			
////			reding data 
//			byte[] data = new byte[is.available()];
//			is.read(data);
//			
////			writing the data 
//			fos.write(data); 
//			
//			fos.close();
//		} catch (Exception e) {
//				e.printStackTrace();
//		}

//		H:\Projects\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\shopstar\img

//		message send
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Product added successfully");
			response.sendRedirect("admin.jsp");
			return;

		}

	}

}
