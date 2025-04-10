CREATE FUNCTION dbo.InitCap (@input NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @pos INT = 1,
            @len INT = LEN(@input),
            @output NVARCHAR(MAX) = '',
            @char NCHAR(1),
            @capitalize BIT = 1;

    WHILE @pos <= @len
    BEGIN
        SET @char = SUBSTRING(@input, @pos, 1);
        IF @char LIKE '[A-Za-z]' AND @capitalize = 1
        BEGIN
            SET @output += UPPER(@char);
            SET @capitalize = 0;
        END
        ELSE
        BEGIN
            SET @output += LOWER(@char);
            IF @char = ' '
                SET @capitalize = 1;
        END
        SET @pos += 1;
    END

    RETURN @output;
END;
