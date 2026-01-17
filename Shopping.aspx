<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shopping.aspx.cs" Inherits="ShoppingApp1.Shopping" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Alien Ship for Sale</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style>
        :root {
            --bg1: #0f2027; --bg2: #203a43; --bg3: #2c5364;
            --glass: rgba(255,255,255,.08);
            --glass-border: rgba(255,255,255,.18);
            --text: #ecf2f8; --muted: #c2d1dd;
            --accent: #00c6ff; --accent-2: #0072ff;
        }

        * { box-sizing: border-box }
        html, body { height: 100% }

        body {
            margin: 0;
            font-family: Segoe UI, Roboto, Arial, Helvetica, sans-serif;
            color: var(--text);
            background: linear-gradient(135deg, var(--bg1), var(--bg2) 45%, var(--bg3));
            background-attachment: fixed;
        }

        .wrap { max-width: 1200px; margin: 0 auto; padding: 32px 20px 60px; }
        .panel {
            background: var(--glass);
            border: 1px solid var(--glass-border);
            border-radius: 16px;
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            box-shadow: 0 10px 30px rgba(0,0,0,.35);
            padding: 32px;
        }

        h1 { text-align: center; margin: 0 0 24px 0; font-size: clamp(28px, 3vw, 40px); }

        h2 {
            text-align: center;
            font-size: 22px;
            color: var(--accent);
            margin-top: 30px;
            margin-bottom: 12px;
        }

        p.subtext {
            text-align: center;
            color: var(--muted);
            margin-top: -8px;
            margin-bottom: 10px;
        }

        .grid { display: grid; grid-template-columns: repeat(5, 1fr); gap: 24px; justify-items: center; }
        @media (max-width: 1100px) { .grid { grid-template-columns: repeat(3, 1fr); } }
        @media (max-width: 700px) { .grid { grid-template-columns: repeat(2, 1fr); } }
        @media (max-width: 480px) { .grid { grid-template-columns: 1fr; } }

        .card {
            background: rgba(255,255,255,.04);
            border: 1px solid rgba(255,255,255,.12);
            border-radius: 14px;
            padding: 12px;
            text-align: center;
            transition: transform .22s ease, box-shadow .22s ease;
            width: 100%; max-width: 220px;
        }

        .card:hover { transform: translateY(-4px); box-shadow: 0 8px 24px rgba(0,0,0,.35); }
        .product-img { width: 100%; height: 200px; object-fit: cover; border-radius: 10px; margin-bottom: 10px; }
        .price { font-size: 20px; font-weight: 700; margin: 6px 0; }

        .qty {
            width: 80px; padding: 6px 8px; border-radius: 8px;
            border: 1px solid rgba(255,255,255,.18);
            background: rgba(0,0,0,.25); color: var(--text);
            margin-top: 6px;
        }

        .qty:focus { outline: none; border-color: var(--accent); }

        .actions { text-align: center; margin-top: 20px; }
        .btn {
            background: linear-gradient(135deg, var(--accent), var(--accent-2));
            border: none; padding: 12px 22px;
            font-size: 18px; font-weight: 600; color: #fff;
            border-radius: 10px; cursor: pointer;
            box-shadow: 0 10px 22px rgba(0, 114, 255, .35);
            transition: transform .15s ease, filter .15s ease;
        }
        .btn:hover { filter: brightness(1.08); transform: translateY(-1px); }

        .cost-row { display: flex; align-items: center; gap: 10px; justify-content: center; margin-top: 24px; font-size: 20px; }
        .cost-input {
            width: 160px; padding: 10px 12px; border-radius: 8px;
            border: 1px solid rgba(255,255,255,.18);
            background: rgba(0,0,0,.25); color: var(--text);
        }

        .field { text-align: center; margin: 16px 0; }
        .label { font-size: 18px; margin-right: 8px; }
        .dropdown {
            padding: 8px; border-radius: 8px; background: rgba(0,0,0,.25);
            color: var(--text); border: 1px solid rgba(255,255,255,.18);
        }

        .listbox {
            width: 100%; height: 200px; margin-top: 24px;
            background: rgba(255,255,255,.04);
            border: 1px solid rgba(255,255,255,.12);
            color: var(--text); padding: 8px;
        }

        hr.divider {
            border: 0; height: 1px; background: rgba(255,255,255,.15);
            margin: 24px 0;
        }
    </style>
</head>
<body>
<form id="form1" runat="server">
    <div class="wrap">
        <h1>Alien Ship for Sale</h1>
        <div class="panel">

            <!-- Product Grid -->
            <div class="grid">
                <div class="card">
                    <img alt="" src="Alien1.jpg" class="product-img" />
                    <div class="price">Explorer 1T</div>
                    <asp:CheckBox ID="chkfood1" runat="server" /><br />
                    <asp:TextBox ID="txtfood1" runat="server" CssClass="qty"></asp:TextBox>
                </div>

                <div class="card">
                    <img alt="" src="Alien2.jpg" class="product-img" />
                    <div class="price">Scout 500B</div>
                    <asp:CheckBox ID="chkfood2" runat="server" /><br />
                    <asp:TextBox ID="txtfood2" runat="server" CssClass="qty"></asp:TextBox>
                </div>

                <div class="card">
                    <img alt="" src="Alien3.jpg" class="product-img" />
                    <div class="price">Defender 900B</div>
                    <asp:CheckBox ID="chkfood3" runat="server" /><br />
                    <asp:TextBox ID="txtfood3" runat="server" CssClass="qty"></asp:TextBox>
                </div>

                <div class="card">
                    <img alt="" src="Alien4.jpg" class="product-img" />
                    <div class="price">Voyager 750B</div>
                    <asp:CheckBox ID="chkfood4" runat="server" /><br />
                    <asp:TextBox ID="txtfood4" runat="server" CssClass="qty"></asp:TextBox>
                </div>

                <div class="card">
                    <img alt="" src="Alien5.jpg" class="product-img" />
                    <div class="price">Titan 4T</div>
                    <asp:CheckBox ID="chkfood5" runat="server" /><br />
                    <asp:TextBox ID="txtfood5" runat="server" CssClass="qty"></asp:TextBox>
                </div>
            </div>

            <!-- Delivery Options -->
<h2>Delivery Options</h2>
<p class="subtext">Choose how your ship will be delivered to your planet.</p>
<div class="actions">
    <asp:RadioButton ID="radnode" runat="server" GroupName="Shipping" Text="No Delivery $0.00" Checked="True" />
    &nbsp;&nbsp;
    <asp:RadioButton ID="radusps" runat="server" GroupName="Shipping" Text="Star Mail 5M" />
    &nbsp;&nbsp;
    <asp:RadioButton ID="radups" runat="server" GroupName="Shipping" Text="Warp Express 15M" />
    &nbsp;&nbsp;
    <asp:RadioButton ID="radfedex" runat="server" GroupName="Shipping" Text="Teleport Delivery 25M" />
</div>

            <hr class="divider" />

            <!-- Ship Engine Upgrades -->
            <h2>Ship Engine Upgrades</h2>
            <p class="subtext">Select the engine type and performance level for your ship.</p>
            <div class="actions">
                <asp:RadioButton ID="Slow1" runat="server" GroupName="Speed" Text="Cruise Engine 2B (Standard)" />
                &nbsp;&nbsp;
                <asp:RadioButton ID="Light1" runat="server" GroupName="Speed" Text="Light Boost 32B (Fast)" />
                &nbsp;&nbsp;
                <asp:RadioButton ID="Super1" runat="server" GroupName="Speed" Text="Hyper Glide 45B (Advanced)" />
                &nbsp;&nbsp;
                <asp:RadioButton ID="Ultra1" runat="server" GroupName="Speed" Text="Nova Burst 300B (Elite)" />
            </div>

            <hr class="divider" />

          <!-- Packaging Options -->
<h2>Order Details</h2>
<p class="subtext">Enter your name and choose your preferred packaging before checkout.</p>
<div class="field">
    <span class="label">Customer Name:</span>
    <asp:TextBox ID="txtcustomer" runat="server" CssClass="cost-input"></asp:TextBox>
</div>

<div class="field">
    <span class="label">Packaging Options:</span>
    <asp:DropDownList ID="cbopackaging" runat="server" CssClass="dropdown">
        <asp:ListItem Selected="True" Value="0.00">-- No Packaging --</asp:ListItem>
        <asp:ListItem Value="1000000">Basic Pod $1M</asp:ListItem>
        <asp:ListItem Value="3000000">Secure Shell $3M</asp:ListItem>
        <asp:ListItem Value="5000000">Titan Shield $5M</asp:ListItem>
    </asp:DropDownList>
</div>



            <!-- Buttons -->
            <div class="actions">
                <asp:Button ID="cmdcompute" OnClick="Compute_Click" runat="server" Text="Calculate Total" CssClass="btn" />
                &nbsp;&nbsp;
                <asp:Button ID="clearbutton" runat="server" OnClick="clearButton_Click" Text="Reset Form" CssClass="btn" />
                &nbsp;&nbsp;
                <asp:Button ID="cmdprint" runat="server" OnClick="print_Click" Text="Print Receipt" CssClass="btn" />
            </div>

            <!-- Cost and Total -->
            <div class="cost-row">
                <span>Cost</span>
                <asp:TextBox ID="txtcost" runat="server" CssClass="cost-input"></asp:TextBox>
            </div>

            <div class="cost-row">
                <span>Total Cost</span>
                <asp:TextBox ID="txttotalcost" runat="server" CssClass="cost-input"></asp:TextBox>
            </div>

            <asp:ListBox ID="lstrecords" runat="server" CssClass="listbox"></asp:ListBox>
        </div>
    </div>
</form>
</body>
</html>