#Listing 9.2

select
xml_doc_val.index,
xml_doc_val.value
from demo_xml,
LATERAL FLATTEN(to_array(demo_xml.val:"$" )) xml_doc, 
LATERAL FLATTEN(to_array(xml_doc.VALUE:"$" )) xml_doc_val;