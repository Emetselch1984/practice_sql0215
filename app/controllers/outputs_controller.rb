class OutputsController < ApplicationController
  def index
    sql = <<~SQL
    SELECT SUM(amount) FROM orders;
    SQL
    sql2 = <<~SQL
    SELECT SUM(amount) FROM ORDERS WHERE order_time >= '2017-01-01 00:00:00' AND order_time < '2017-02-01 00:00:00';
    SQL
    result = Order.connection.select_all(sql).to_a
    @sum = result[0]["SUM(amount)"]
    result2 = Order.connection.select_all(sql2).to_a
    @sum2 = result2[0]["SUM(amount)"]
  end
end
