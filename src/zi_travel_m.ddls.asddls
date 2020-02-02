@AbapCatalog.sqlViewName: 'ZVI_TRAVEL_M'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Data model for travel'
define root view ZI_TRAVEL_M 
    as select from ztravel as Travel 
    /* Associations */
    association [0..1] to /DMO/I_Agency   as _Agency   on $projection.agency_id = _Agency.AgencyID
    association [0..1] to /DMO/I_Customer as _Customer on $projection.customer_id = _Customer.CustomerID
    association [0..1] to I_Currency      as _Currency on $projection.currency_code = _Currency.Currency 
{
    key travel_id,
    agency_id,
    customer_id,
    begin_date,
    end_date,
    @Semantics.amount.currencyCode: 'currency_code'
    booking_fee,
    @Semantics.amount.currencyCode: 'currency_code'
    total_price,
    @Semantics.currencyCode: true
    currency_code,
    overall_status,
    description,
    /*-- Admin data --*/
    @Semantics.user.createdBy: true
    created_by,
    @Semantics.systemDateTime.createdAt: true
    created_at,
    @Semantics.user.lastChangedBy: true
    last_changed_by,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at,
    /* Public associations */
    _Agency,
    _Customer,
    _Currency
}
