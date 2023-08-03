DELIMITER //

CREATE PROCEDURE AddValidBooking(
  IN booking_date DATE,
  IN table_number INT
)
BEGIN
  DECLARE existing_booking INT;
  
  START TRANSACTION;
  
  -- Check if the table is already booked on the given date
  SELECT COUNT(*) INTO existing_booking
  FROM bookings
  WHERE booking_date = booking_date AND table_number = table_number;
  
  IF existing_booking > 0 THEN
    -- Rollback the transaction if the table is already booked
    ROLLBACK;
    SELECT 'Table ', table_number , ' is already booked - Booking cancelled.' AS message;
  ELSE
    -- Insert a new booking record if the table is available
    INSERT INTO bookings (booking_date, table_number)
    VALUES (booking_date, table_number);
    
    -- Commit the transaction
    COMMIT;
    SELECT 'Booking successful.' AS message;
  END IF;
  
END //

DELIMITER ;
