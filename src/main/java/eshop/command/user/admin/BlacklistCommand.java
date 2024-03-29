package eshop.command.user.admin;

import com.google.protobuf.ServiceException;
import eshop.command.Command;
import eshop.command.page.ToAccountPage;
import eshop.dao.DaoUser;
import eshop.entity.User;
import eshop.service.user.CRUDUser;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * @author Евгений
 */
public class BlacklistCommand implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, MessagingException, ServletException, SQLException, ServiceException {
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        DaoUser daoUser = new DaoUser();
        User user = daoUser.findById(user_id);
        if (user.getRole().equals("client")) {
            user.setRole("blocked_client");
        } else user.setRole("client");
        CRUDUser.update(user);
        Command command = new ToAccountPage();
        command.execute(request, response);
    }
}
