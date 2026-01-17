using System;
using System.Globalization;
using System.Web.UI;

namespace ShoppingApp1
{
    public partial class Shopping : Page
    {
        private const decimal T = 1_000_000_000_000m; // trillion
        private const decimal B = 1_000_000_000m;     // billion
        private const decimal M = 1_000_000m;         // million

        protected void Page_Load(object sender, EventArgs e) { }

        protected void Compute_Click(object sender, EventArgs e)
        {
            ComputeTotalsOnly();
        }

        private void ComputeTotalsOnly()
        {
            decimal shipCost = 0m;
            string shipSummary = "";

            // 🛸 Handle multiple ships with quantities and total cost per type
            if (chkfood1.Checked)
            {
                int qty = ParseQty(txtfood1.Text);
                decimal subtotal = qty * (1 * T);
                shipCost += subtotal;
                shipSummary += $"Explorer x{qty} = {FormatCurrency(subtotal, B, T)}\n";
            }
            if (chkfood2.Checked)
            {
                int qty = ParseQty(txtfood2.Text);
                decimal subtotal = qty * (500 * B);
                shipCost += subtotal;
                shipSummary += $"Scout x{qty} = {FormatCurrency(subtotal, B, T)}\n";
            }
            if (chkfood3.Checked)
            {
                int qty = ParseQty(txtfood3.Text);
                decimal subtotal = qty * (900 * B);
                shipCost += subtotal;
                shipSummary += $"Defender x{qty} = {FormatCurrency(subtotal, B, T)}\n";
            }
            if (chkfood4.Checked)
            {
                int qty = ParseQty(txtfood4.Text);
                decimal subtotal = qty * (750 * B);
                shipCost += subtotal;
                shipSummary += $"Voyager x{qty} = {FormatCurrency(subtotal, B, T)}\n";
            }
            if (chkfood5.Checked)
            {
                int qty = ParseQty(txtfood5.Text);
                decimal subtotal = qty * (4 * T);
                shipCost += subtotal;
                shipSummary += $"Titan x{qty} = {FormatCurrency(subtotal, B, T)}\n";
            }

            if (string.IsNullOrWhiteSpace(shipSummary))
                shipSummary = "None Selected";

            // ⚙️ Engine Upgrades
            string engineDisplay = "None";
            decimal engineCost = 0m;
            if (Slow1.Checked) { engineDisplay = "Cruise Engine $2B"; engineCost = 2 * B; }
            else if (Light1.Checked) { engineDisplay = "Light Boost $32B"; engineCost = 32 * B; }
            else if (Super1.Checked) { engineDisplay = "Hyper Glide $45B"; engineCost = 45 * B; }
            else if (Ultra1.Checked) { engineDisplay = "Nova Burst $300B (Elite)"; engineCost = 300 * B; }

            // 🚚 Delivery Options
            string deliveryDisplay = "No Delivery $0";
            decimal deliveryCost = 0m;
            if (radusps.Checked) { deliveryDisplay = "Star Mail $5M"; deliveryCost = 5 * M; }
            else if (radups.Checked) { deliveryDisplay = "Warp Express $15M"; deliveryCost = 15 * M; }
            else if (radfedex.Checked) { deliveryDisplay = "Teleport Delivery $25M"; deliveryCost = 25 * M; }

            // 📦 Packaging Options
            string packagingDisplay = cbopackaging.SelectedItem.Text;
            decimal packagingCost = 0m;
            if (decimal.TryParse(cbopackaging.SelectedValue, NumberStyles.Any, CultureInfo.InvariantCulture, out var pack))
                packagingCost = pack;

            // 💰 Total Calculation
            decimal total = shipCost + engineCost + deliveryCost + packagingCost;

            txtcost.Text = total.ToString("N2", CultureInfo.InvariantCulture);
            txttotalcost.Text = total.ToString("N2", CultureInfo.InvariantCulture);

            // Save for print
            ViewState["ShipSummary"] = shipSummary.Trim();
            ViewState["EngineDisplay"] = engineDisplay;
            ViewState["DeliveryDisplay"] = deliveryDisplay;
            ViewState["PackagingDisplay"] = packagingDisplay;
            ViewState["TotalCost"] = total;
        }

        private static int ParseQty(string input)
        {
            return int.TryParse(input, out var q) && q > 0 ? q : 1;
        }

        // 🔢 Format billions/trillions into readable form
        private static string FormatCurrency(decimal value, decimal billion, decimal trillion)
        {
            if (value >= trillion)
                return $"${(value / trillion):0.###}T";
            else if (value >= billion)
                return $"${(value / billion):0.###}B";
            else
                return $"${(value / 1_000_000):0.#}M";
        }

        protected void clearButton_Click(object sender, EventArgs e)
        {
            txtcustomer.Text = "";
            txtfood1.Text = txtfood2.Text = txtfood3.Text = txtfood4.Text = txtfood5.Text = "";
            txtcost.Text = txttotalcost.Text = "";
            chkfood1.Checked = chkfood2.Checked = chkfood3.Checked = chkfood4.Checked = chkfood5.Checked = false;
            radusps.Checked = radups.Checked = radfedex.Checked = false;
            Slow1.Checked = Light1.Checked = Super1.Checked = Ultra1.Checked = false;
            cbopackaging.SelectedIndex = 0;
            lstrecords.Items.Clear();
        }

        protected void print_Click(object sender, EventArgs e)
        {
            lstrecords.Items.Clear();
            ComputeTotalsOnly();

            lstrecords.Items.Add("================= PURCHASE SUMMARY ==============");
            lstrecords.Items.Add($"Customer: {txtcustomer.Text}");
            lstrecords.Items.Add("");
            lstrecords.Items.Add("Selected Alien Ships:");
            lstrecords.Items.Add(ViewState["ShipSummary"].ToString());
            lstrecords.Items.Add($"Engine Upgrade: {ViewState["EngineDisplay"]}");
            lstrecords.Items.Add($"Delivery Option: {ViewState["DeliveryDisplay"]}");
            lstrecords.Items.Add($"Packaging: {ViewState["PackagingDisplay"]}");
            lstrecords.Items.Add("");
            lstrecords.Items.Add($"Total Due: ${((decimal)ViewState["TotalCost"]).ToString("N2", CultureInfo.InvariantCulture)}");
            lstrecords.Items.Add($"Date: {DateTime.Now:MM/dd/yyyy hh:mm:ss tt}");
            lstrecords.Items.Add("=================================================");
        }
    }
}