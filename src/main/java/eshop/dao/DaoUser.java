package eshop.dao;

import com.google.protobuf.ServiceException;
import eshop.entity.User;
import eshop.service.PasswordService;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

/**
 * @author Евгений
 */
public class DaoUser {

    final static ResourceBundle resourceBundle = ResourceBundle.getBundle("sqlstatements");

    public DaoUser() {
    }

    final static String INSERT_USER = resourceBundle.getString("INSERT_USER");
    final static String FIND_ALL_USERS = resourceBundle.getString("FIND_ALL_USERS");
    final static String FIND_USER_BY_USERNAME = resourceBundle.getString("FIND_USER_BY_USERNAME");
    final static String FIND_USER_BY_ID = resourceBundle.getString("FIND_USER_BY_ID");
    final static String FIND_USER_BY_EMAIL = resourceBundle.getString("FIND_USER_BY_EMAIL");
    final static String FIND_USER_WHERE_USERNAME_AND_PASSWORD = resourceBundle.getString("FIND_USER_WHERE_USERNAME_AND_PASSWORD");
    final static String FIND_USER_WHERE_USERNAME_AND_EMAIL = resourceBundle.getString("FIND_USER_WHERE_USERNAME_AND_EMAIL");

    public boolean findByEmail(User user) throws SQLException, ServiceException {
        PreparedStatement preparedStatement = DaoFactory.getConnection().prepareStatement(FIND_USER_BY_EMAIL);
        preparedStatement.setString(1, user.getEmail());

        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            setProps(user, resultSet);
            return true;
        }

        return false;
    }

    public boolean findByUsernameAndEmail(User user) throws SQLException, ServiceException {
        PreparedStatement statement = DaoFactory.getConnection().prepareStatement(FIND_USER_WHERE_USERNAME_AND_EMAIL);
        statement.setString(1, user.getUsername());
        statement.setString(2, user.getEmail());
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            setProps(user, resultSet);
            return true;
        }
        return false;
    }

    public List<User> findAll() throws SQLException {
        List<User> usersList = new ArrayList<>();
        Statement statement = DaoFactory.getConnection().createStatement();
        ResultSet resultSet = statement.executeQuery(FIND_ALL_USERS);
        while (resultSet.next()) {
            usersList.add(new User(resultSet.getInt("id"),resultSet.getString("username"), resultSet.getString("email"), resultSet.getString("firstname"), resultSet.getString("lastname"), resultSet.getString("role")));
        }
        return usersList;
    }

    public User findById(int user_Id) throws SQLException, ServiceException {
        User user = new User();
        PreparedStatement preparedStatement = DaoFactory.getConnection().prepareStatement(FIND_USER_BY_ID);
        preparedStatement.setInt(1, user_Id);

        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            setProps(user, resultSet);
        }
        return user;
    }

    public boolean findByUsernameAndPassword(User user) throws SQLException, ServiceException {
        PreparedStatement statement = DaoFactory.getConnection().prepareStatement(FIND_USER_WHERE_USERNAME_AND_PASSWORD);
        statement.setString(1, user.getUsername());
        statement.setString(2, PasswordService.passwordHash(user.getPassword()));
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            setProps(user, resultSet);
            return true;
        }
        return false;
    }

    private void setProps(User user, ResultSet resultSet) throws SQLException {
        user.setId(resultSet.getInt("id"));
        user.setUsername(resultSet.getString("username"));
        user.setPassword(resultSet.getString("password"));
        user.setEmail(resultSet.getString("email"));
        user.setFirstname(resultSet.getString("firstname"));
        user.setLastname(resultSet.getString("lastname"));
        user.setAddress(resultSet.getString("address"));
        user.setRole(resultSet.getString("role"));
    }

}
