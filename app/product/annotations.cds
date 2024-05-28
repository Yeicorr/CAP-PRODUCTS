using CatalogService as service from '../../srv/catalog-service';

annotate service.Products with @(
    Capabilities                 : {DeleteRestrictions: {Deletable: false}},
    UI.HeaderInfo                : {
        TypeName      : '{18n>Product}', //'Product',
        TypeNamePlural: '{18n>Products}', //'Products',
        ImageUrl      : ImageUrl,
        Title         : {Value: ProductName},
        Description   : {Value: Description}
    },

    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            // {
            //     $Type: 'UI.DataField',
            //     Label: 'ProductName',
            //     Value: ProductName,
            // },
            // {
            //     $Type: 'UI.DataField',
            //     Label: 'Description',
            //     Value: Description,
            // },
            // {
            //     $Type: 'UI.DataField',
            //     Label: 'ImageUrl',
            //     Value: ImageUrl,
            // },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>ReleaseDate}', //'ReleaseDate',
                Value: ReleaseDate,
            },
            // {
            //     $Type : 'UI.DataFieldForAnnotation',
            //     Label : 'Rating',
            //     Target: '@UI.DataPoint#AverageRating'
            // },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>DiscontinuedDate}', //'DiscontinuedDate',
                Value: DiscontinuedDate,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Price}', //'Price',
                Value: Price,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Height}', //'Height',
                Value: Height,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Width}', //'Width',
                Value: Width,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Depth}', //'Depth',
                Value: Depth,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Quantity}', //'Quantity',
                Value: Quantity,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>ToUnitOfMeasure_Id}', //'ToUnitOfMeasure_Id',
                Value: ToUnitOfMeasure_Id,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>ToCurrency_Id}', //'ToCurrency_Id',
                Value: ToCurrency_Id,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>ToCategory_Id}', //'ToCategory_Id',
                Value: ToCategory_Id,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Category}', //'Category',
                Value: Category,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>ToDimensionUnit_Id}', //'ToDimensionUnit_Id',
                Value: ToDimensionUnit_Id,
            },
        ],
    },
    UI.Facets                    : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet1',
            Label : '{i18n>GeneralInformation}', //'General Information',
            Target: '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet2',
            Label : '{i18n>GeneralInformationCopy}', //'General Information Copia',
            Target: '@UI.FieldGroup#GeneratedGroup',
        }
    ],
    UI.HeaderFacets              : [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.DataPoint#AverageRating'
    }],
    UI.SelectionFields           : [
        CategoryId, // ToCategory_Id,
        CurrencyId, // ToCurrency_Id,
    ],
    UI.LineItem                  : [
        {
            $Type: 'UI.DataField',
            Label: '{i18n>ImageUrl}', //'ImageUrl',
            Value: ImageUrl,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>ProductName}', //'ProductName',
            Value: ProductName,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>Description}', //'Description',
            Value: Description,
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Label : '{i18n>Supplier}', //'Supplier',
            Target: 'Supplier/@Communication.Contact'
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>ReleaseDate}', //'ReleaseDate',
            Value: ReleaseDate,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>DiscontinuedDate}', //'DiscontinuedDate',
            Value: DiscontinuedDate,
        },
        {
            Label      : '{i18n>StockAvailability}', //'Stock Availability',
            Value      : StockAvailability,
            Criticality: StockAvailability,
        },
        // {
        //     // $Type: 'UI.DataField',
        //     Label : 'Rating',
        //     $Type : 'UI.DataFieldForAnnotation',
        //     // Value: Rating
        //     Target: '@UI.DataPoint#AverageRating'
        // },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>Price}', //'Price',
            Value: Price
        }
    ],
);

annotate service.Products with {
    Supplier @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Supplier',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: Supplier_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'Name',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'Email',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'Phone',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'Fax',
            },
        ],
    }
};

/**
* Annotations for SH
*/
annotate service.Products with {
    //Category
    ToCategory @(Common: {
        Text     : {
            $value                : Category,
            ![@UI.TextArrangement]: #TextOnly,
        },
        ValueList: {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'VH_Categories',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: ToCategory_Id,
                    ValueListProperty: 'Code'
                },
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: ToCategory_Id,
                    ValueListProperty: 'Text'
                }
            ]
        },
    });
    //Currency
    ToCurrency @(Common: {
        ValueListWithFixedValues: false,
        ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'VH_Currencies',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: ToCurrency_Id,
                    ValueListProperty: 'Code'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'Text'
                }
            ]
        },
    });
};

/**
* Annotations for VH_Categories Entity
*/
annotate service.VH_Categories with {
    Code @(
        UI    : {Hidden: true},
        Common: {Text: {
            $value                : Text,
            ![@UI.TextArrangement]: #TextOnly,
        }}
    );
    Text @(UI: {HiddenFilter: true});
};

/**
* Annotations for VH_Currency Entity
*/
annotate service.VH_Currencies {
    Code @(UI: {
        title       : '{i18n>Code}',
        HiddenFilter: true
    });
    Text @(UI: {
        title       : '{i18n>Code}',
        HiddenFilter: true
    });
};

/**
* Annotations for VH_UnitOfMeasure Entity
*/
annotate service.VH_UnitOfMeasure {
    Code @(UI: {
        title       : '{i18n>Code}',
        HiddenFilter: true
    });
    Text @(UI: {
        title       : '{i18n>Code}',
        HiddenFilter: true
    });
};

/**
* Annotations for VH_DimensionUnits Entity
*/
annotate service.VH_DimensionUnits {
    Code @(UI: {
        title       : '{i18n>Code}',
        HiddenFilter: true
    });
    Text @(UI: {
        title       : '{i18n>Code}',
        HiddenFilter: true
    });
};

annotate service.Products with {
    ImageUrl @(UI.IsImageURL: true)
};

/**
* Annotations for Supplier Entity
*/
annotate service.Supplier with @(Communication: {Contact: {
    fn   : Name,
    role : 'Suppliers',
    photo: 'sap-icon://supplier',
    email: [{
        type   : #work,
        address: Email
    }],
    tel  : [
        {
            type: #work,
            uri : Phone
        },
        {
            type: #fax,
            uri : Fax
        }
    ]
}});

/**
* Data Point for Average Rating
*/
annotate service.Products with @(UI.DataPoint #AverageRating: {
    Value        : Rating,
    Title        : '{i18n>Rating}', //'Rating',
    TargetValue  : 5,
    Visualization: #Rating
});

annotate service.Products with {
    CategoryId        @title: '{i18n>CategoryId}';
    CurrencyId        @title: '{i18n>CurrencyId}';
    StockAvailability @title: '{i18n>StockAvailability}';
};
