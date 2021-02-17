# frozen_string_literal: true

class OutputsController < ApplicationController
  def index
    sql = <<~SQL
      SELECT SUM(amount) FROM orders;
    SQL
    sql2 = <<~SQL
      SELECT SUM(amount) FROM ORDERS WHERE order_time >= '2017-01-01 00:00:00' AND order_time < '2017-02-01 00:00:00';
    SQL
    sql3 = <<~SQL
      SELECT AVG(price) FROM products;
    SQL
    sql4 = <<~SQL
      SELECT MIN(price) FROM products;
    SQL
    sql5 = <<~SQL
      SELECT MAX(price) FROM products;
    SQL
    sql6 = <<~SQL
      select count(distinct user_id) from access_logs where request_month = '2017-01-01'
    SQL
    sql7 = <<~SQL
      select prefecture_id,count(*) from users group by prefecture_id;
    SQL
    result = Order.connection.select_all(sql).to_a
    @sum = result[0]['SUM(amount)']
    result2 = Order.connection.select_all(sql2).to_a
    @sum2 = result2[0]['SUM(amount)']
    result3 = Product.connection.select_all(sql3).to_a
    @avg = result3[0]['AVG(price)']
    result4 = Product.connection.select_all(sql4).to_a
    @minPrice = result4[0]['MIN(price)']
    result5 = Product.connection.select_all(sql5).to_a
    @maxPrice = result5[0]['MAX(price)']
    @userCount = User.all.size
    result6 = AccessLog.connection.select_all(sql6).to_a
    @accesslog = result6[0]['count(distinct user_id)']
      @prefectures = User.connection.select_all(sql7).to_a
  end
end
