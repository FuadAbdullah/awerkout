<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="Nutrition.aspx.cs" Inherits="awerkout.Nutrition" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="mainstyle.css" />
    <link rel="stylesheet" href="nutritionstyle.css" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdditionalNavOption1" runat="server">
     <table style="width: 100%;" class="table">
        <tr>
            <td>
                <asp:LinkButton ID="myProfilelnk" class="nav" runat="server" OnClick="myProfilelnk_Click">My Profile</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="signOutlnk" class="nav" runat="server" OnClick="signOutlnk_Click">Sign Out</asp:LinkButton>
            </td>
        </tr>
    </table>
    <table style="width: 100%;" class="table">
        <tr>
            <td>
                <asp:LinkButton ID="signinlnk" class="nav" runat="server" OnClick="signInlnk_Click">Sign In</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentBlock" runat="server">
    <asp:Label ID="greetLbl" runat="server" Text="Hello there!" Font-Bold="True"></asp:Label>
    <div class="container">
        <div class="header" style="margin-top: 100px">
            Calorie Needs and Macronutrients
        </div>
        <div class="content">
            <br />
            The goal for competitive bodybuilders is to 
            increase muscle mass in the bulking phase and reduce 
            body fat in the cutting phase. Hence, you consume more 
            calories in the bulking phase than in the cutting phase.
        </div>
        <div class="header">
            How Many Calories Do You Need?
        </div>
        <div class="content">
            <br />
            The easiest way to determine how many calories you 
            need is to weigh yourself at least three times a week and record 
            what you eat using a calorie tracking app.
            <br />
            <br />
            If your weight stays the same, the daily number of calories 
            you eat is your maintenance calories. This is the level where 
            you’re not losing or gaining weight but maintaining it.
            <br />
            <br />
            During your bulking phase, you should increase your calorie intake 
            by around 15%. For example, if your maintenance calories are 
            3,000 per day, you should eat 3,450 calories per day (3,000 x 0.15 = 450) 
            during your bulking phase (6Trusted Source).
            <br />
            <br />
            When transitioning from a bulking to a cutting phase, you would instead 
            decrease your maintenance calories by 15%, meaning you would eat 2,550 
            calories per day instead of 3,450.
            <br />
            <br />
            As you gain weight in the bulking phase or lose weight in the cutting phase, 
            you will need to adjust your calorie intake at least monthly to account 
            for changes in your weight.
            <br />
            <br />
            Increase your calories as you gain weight in the bulking phase and decrease 
            your calories as you lose weight in the cutting phase for continued progression.
            <br />
            <br />
            During either phase, it’s recommended not to lose or gain more than 0.5–1% 
            of your body weight per week. This ensures that you don’t lose too much 
            muscle during the cutting phase or gain too much body fat during the 
            bulking phase (7Trusted Source).
        </div>
        <div class="header">
            Macronutrient Ratio
        </div>
        <div class="content">
            <br />
            Once you establish the calories you need, you can determine your 
            macronutrient ratio, which is the ratio between your protein, 
            carbohydrate, and fat intake.
            <br />
            <br />
            Unlike the difference in calorie needs between the bulking and 
            cutting phase, your macronutrient ratio does not change.
            <br />
            <br />
            Protein and carbs contain four calories per gram (g), 
            and fat contains nine. Recommended intakes include: 
            (6Trusted Source, 7Trusted Source):
            <br />
            <br />
            <li>30–35% of your calories from protein</li><br />
            <li>55–60% of your calories from carbs</li><br />
            <li>15–20% of your calories from fat</li><br /><br />
            Here’s an example of the ratio for both a bulking and cutting phase:
            <br />
            <br />
                <table class="auto-style1">
                    <tr>
                        <td>&nbsp;</td>
                        <td>Bulking phase</td>
                        <td>Cutting phase</td>
                    </tr>
                    <tr>
                        <td>Calories</td>
                        <td>3450</td>
                        <td>2550</td>
                    </tr>
                    <tr>
                        <td>Protein (g)</td>
                        <td>259-302</td>
                        <td>191-223</td>
                    </tr>
                    <tr>
                        <td>Carbohydrates (g)</td>
                        <td>474-518</td>
                        <td>351-383</td>
                    </tr>
                    <tr>
                        <td>Fat (g)</td>
                        <td>58-77</td>
                        <td>43-57</td>
                    </tr>
                </table>
            <br />
            These are general guidelines, so it’s best to consult with 
            a registered dietitian to determine your individual needs based on 
            your goals to ensure your diet is nutritionally adequate.
        </div>
    </div>
</asp:Content>
