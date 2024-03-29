package eshop.entity;

import java.util.Objects;

/**
 * @author Евгений
 */
public class Order {
    private int id;
    private int product_id;
    private int user_id;

    public Order(int id, int product_id, int user_id) {
        this.id = id;
        this.product_id = product_id;
        this.user_id = user_id;
    }

    public Order(int product_id, int user_id) {
        this.product_id = product_id;
        this.user_id = user_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Order order = (Order) o;
        return id == order.id &&
                product_id == order.product_id &&
                user_id == order.user_id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, product_id, user_id);
    }
}
