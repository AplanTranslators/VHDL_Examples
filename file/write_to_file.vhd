library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use STD.TEXTIO.ALL;

entity file_write is
end entity file_write;

architecture behavioral of file_write is
begin
    process
        file output_file : text;
        variable file_line : line;
        variable status : file_open_status;
    begin
        -- Open file for writing
        file_open(status, output_file, "output.txt", write_mode);
        assert status = open_ok
            report "Failed to open output.txt for writing"
            severity error;

        -- Write integers 1 to 5 to the file
        for i in 1 to 5 loop
            write(file_line, i);
            writeline(output_file, file_line);
        end loop;

        -- Close the file
        file_close(output_file);
        report "Write operation completed" severity note;
        wait;
    end process;
end architecture behavioral;