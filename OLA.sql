CREATE DATABASE Ola;
USE Ola;
-- Select * From Bookings 

# 1. Retrieve all successful bookings:
Create view  Successful_Bookings as
Select * From Bookings
WHERE Booking_Status = "Success";

-- Select * From  Successful_Bookings

# 2. Find the average ride distance for each vehicle type:
Create View average_ride_distance_for_each_vehicle As
Select Vehicle_Type, Avg(Ride_Distance)
As Avg_Distance From Bookings
Group By Vehicle_Type;

-- Select * From average_ride_distance_for_each_vehicle

# 3. Get the total number of cancelled rides by customers:
-- Create View cancelled_rides_by_customer As
-- Select Count(*) As Numbers_of_cancelled_rides_by_customers From Bookings
-- Where Booking_Status = "Canceled by Customer"

-- Select * From cancelled_rides_by_customer;

# 4. List the top 5 customers who booked the highest number of rides:
Create View Top_5_Customers_book_rides As
Select Customer_ID, Count(Booking_ID) As Total_Rides
From Bookings
Group By Customer_ID 
Order By Total_Rides Desc Limit 5;

-- Select * From Top_5_Customers_book_rides;

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues
Create View Rides_Cancelled_By_Drivers_P_C_related_issue As
Select Count(*) From Bookings
Where Canceled_Rides_by_Driver = "Personal & Car related issue" ;

Select * From Rides_Cancelled_By_Drivers_P_C_related_issue ;

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create view max_min_driver_rating_for_prime_sedan As
Select Max(Driver_Ratings) As max_rating,
Min(Driver_Ratings) As min_rating
From Bookings Where Vehicle_Type = "Prime Sedan";

-- Select * From max_min_driver_rating_for_prime_sedan

# 7. Retrieve all rides where payment was made using UPI:
Create View Payment_UPI As
Select * From Bookings
Where Payment_Method = "UPI";

# 8. Find the average customer rating per vehicle type:
Create View avg_cust_ratings As
Select Vehicle_Type, Avg(Customer_Rating) as avg_cust_rating
From Bookings
Group By Vehicle_Type;

# 9. Calculate the total booking value of rides completed successfully:
Create View total_completed_bookings_rides As
Select Sum(Booking_Value) As total_completed_rides
From Bookings
Where Booking_Status = "Success";

# 10. List all incomplete rides along with the reason:
Create View incomplete_rides_with_reason As
Select  Booking_ID, Incomplete_Rides_Reason  
From bookings
Where Incomplete_Rides ="Yes";
