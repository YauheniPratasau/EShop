package eshop.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
    void execute(HttpServletRequest httpRequest, HttpServletResponse httpResponse);
}