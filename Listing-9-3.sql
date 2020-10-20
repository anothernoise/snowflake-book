#Listing 9.3

create view stats_by_zip AS
select
XMLGET( xml_doc_val.value, 'jurisdiction_name' ):"$" as "Jurisdiction_Name",
XMLGET( xml_doc_val.value, 'count_participants' ):"$" as "Count_Participants",
XMLGET( xml_doc_val.value, 'count_female' ):"$" as "Count_Female",
XMLGET( xml_doc_val.value, 'count_male' ):"$"
as "Count_Male" from demo_xml,
LATERAL FLATTEN(to_array(demo_xml.val:"$" )) xml_doc, 
LATERAL FLATTEN(to_array(xml_doc.VALUE:"$" )) xml_doc_val; 

select * from stats_by_zip;