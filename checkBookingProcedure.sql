CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckBooking`(IN dateValue DATE, IN table_Nr INT)
BEGIN
    -- Declare a variable to store the confirmation message
    DECLARE Message VARCHAR(100);
    
    -- Check if the table exists in bookings table for the specific date
    IF EXISTS (SELECT 1 FROM Bookings WHERE bookings.tableNr = table_Nr and
				bookings.date = dateValue) THEN
        -- Set the booked table message
        SET Message = CONCAT('Table ', table_Nr, ' is already booked.');
    ELSE
        -- If the table is free set confirmation message
        SET Message = CONCAT('Table ', table_Nr, ' is available for ', datevalue);
    END IF;
    
    -- Print the confirmation or error message
    SELECT  Message AS Confirmation;
END