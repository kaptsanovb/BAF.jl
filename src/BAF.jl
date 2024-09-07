module BAF

    @enum Endian begin
        Small
        Big
    end

    @enum Major begin
        Row
        Column
    end


    function baf_header(dims::Tuple{Vararg{Core.Integer}}, data_struct::T; endian::Endian = Endian.Little, major::Major = Major.Column)::Vector{UInt8} where T <: DataType
        rank::UInt8 = length(dims)
        settings::UInt8 = (major << 1) + endian

        dims_bytecount::Tuple{Vararg{UInt8}} = ceil(ndigits.(dims, base=2) / 8)
    end

end
