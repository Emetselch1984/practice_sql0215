module Sql
  extend ActiveSupport::Concern
  SumSql = <<~SQL
      SELECT SUM(amount) FROM orders;
  SQL
  SumSql2 = <<~SQL
      SELECT SUM(amount) FROM ORDERS WHERE order_time >= '2017-01-01 00:00:00' AND order_time < '2017-02-01 00:00:00';
  SQL
  AvgSql = <<~SQL
      SELECT AVG(price) FROM products;
  SQL
  MinSql = <<~SQL
      SELECT MIN(price) FROM products;
  SQL
  MaxSql = <<~SQL
      SELECT MAX(price) FROM products;
  SQL
  CountUser = <<~SQL
      select count(distinct user_id) from access_logs where request_month = '2017-01-01'
  SQL
  PrefectureCount = <<~SQL
      select prefecture_id,count(*) from users group by prefecture_id;
  SQL
  HighRequestLogMonth = <<~SQL
   select request_month,count(distinct user_id) from access_logs 
   where request_month >= '2017-01-01' and request_month <= '2017-12-01' group by request_month
   having count(distinct user_id) >= 640
  SQL

end