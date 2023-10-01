<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FluentUIASPNet._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>

        <div class="row">
            <script>
                var _gridInstance;
                function showDialog() {
                    loadGrid();
                    let dialogElement = document.getElementById("defaultDialog");
                    dialogElement.hidden = false;                    
                }
                function closeDialog() {
                    let treeView = document.getElementById("treeView");
                    let msg = "Selected items:";
                    if (treeView.currentSelected)
                        msg += " Tree: " + treeView.currentSelected.attributes.itemid.value;
                    if (_gridInstance)
                        msg += " Grid: " + _gridInstance.getCheckedRowKeys();
                    if (msg !== " Selected items: \n")
                        alert(msg);

                    let dialogElement = document.getElementById("defaultDialog");
                    dialogElement.hidden = true;
                }
                function loadGrid() {
                    _gridInstance = new tui.Grid({
                        el: document.getElementById('grid'), // Container element
                        rowHeaders: ['checkbox'],
                        treeColumnOptions: {
                            name: 'name',
                            useCascadingCheckbox: true
                        },
                        keyColumnName: 'id',
                        columns: [
                            {
                                header: 'Name',
                                name: 'name'
                            },
                            {
                                header: 'Artist',
                                name: 'artist'
                            },
                            {
                                header: 'Release',
                                name: 'release'
                            },
                            {
                                header: 'Genre',
                                name: 'genre'
                            }
                        ],
                        data: [
                            {
                                id: "1",
                                name: 'Beautiful Lies',
                                artist: 'Birdy',
                                release: '2016.03.26',
                                genre: 'Pop',
                                _children: [
                                    {
                                        id: "1.1",
                                        name: 'Still loving you',
                                        artist: 'Scorpions',
                                        release: '2016.03.26',
                                        genre: 'Rock'
                                    }
                                ]
                            },                            
                            {
                                id: "2",
                                name: 'Beautiful Lifes',
                                artist: 'Ace of Base',
                                release: '2016.03.26',
                                genre: 'Pop',
                                _children: [
                                    {
                                        id: "2.1",
                                        name: 'Still loving you',
                                        artist: 'Scorpions',
                                        release: '2016.03.26',
                                        genre: 'Rock'
                                    },
                                    {
                                        id: "2.2",
                                        name: 'Still loving you',
                                        artist: 'Scorpions',
                                        release: '2016.03.26',
                                        genre: 'Rock'
                                    }
                                ]
                            }
                        ]
                    });

                    //instance.resetData(instance.data); // Call API of instance's public method

                    tui.Grid.applyTheme('striped'); // Call API of static method
                }
            </script>
            <h2>Dialog</h2>
            <section class="col-md-4">
                <fast-button appearance="accent" id="dialogOpener" onclick="showDialog()">Show dialog</fast-button>
                <fast-dialog id="defaultDialog" hidden trap-focus modal>
                    <div style="margin: 20px;">
                        <h2>Dialog with text and a button</h2>
                        <fast-tree-view id="treeView">
                            Root
                            <fast-tree-item itemId="1">
                                Item 1
                                <fast-tree-item itemId="1.1">Sub-item 1.1</fast-tree-item>
                                <fast-tree-item itemId="1.2">Sub-item 1.2</fast-tree-item>
                            </fast-tree-item>
                            <fast-tree-item itemId="2">
                                Item 2
                                <fast-tree-item itemId="2.1">Sub-item 2.1</fast-tree-item>
                                <fast-tree-item itemId="2.2">Sub-item 2.2</fast-tree-item>
                            </fast-tree-item>
                        </fast-tree-view>
                        <div id="grid"></div>
                        <fast-button id="dialogCloser" appearance="accent" tabindex="0" onclick="closeDialog()">Dismiss</fast-button>
                    </div>
                </fast-dialog>            
            </section>                        
        </div>

    </main>

</asp:Content>
