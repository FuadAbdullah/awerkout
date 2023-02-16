<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="Advanced.aspx.cs" Inherits="awerkout.Advanced" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="mainstyle.css" />
    <link rel="stylesheet" href="workoutplandetailstyle.css" />
    <style type="text/css">
        .auto-style2 {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdditionalNavOption1" runat="server">
     <table style="width: 100%;" class="table">
        <tr>
            <td>
                <asp:LinkButton ID="myDashboardlnk" class="nav" runat="server" OnClick="myDashboardlnk_Click">My Dashboard</asp:LinkButton>
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
    <div class="header">
        <img src="Images/Advanced header.PNG" id="imgheader"/>
        <div id="txt"> 
            Advanced Workout Routine for Men
            <div class="auto-style2">
            <br />
            <br />
            Evidently, those who are already gym buffs and would like 
            to reach the next level of fitness routine must follow 
            this advanced level workout for men. <br /><br />
            This high-intensity 
            regimen is meant for men and not boys. It would include 
            heavy weight-lifting with minimal rests in between sets. 
            <br /><br />
            Since this routine is more rigorous, the training is set 
            for 6 days per week. You will get one day’s rest for recovery. 
            The goal of this routine is to gift you with an incredible physique.
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <div class="content daytxt">
        Day 1: Chest &amp; Back Workout
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/50.gif" />
                Barbell Bench Press – work 5 rep max today

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/51.gif" />
                Incline Dumbbell Press – aim for 3 sets of 6-8 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/52.gif" />
                Dips – aim for 3 sets of 6-10 reps

            </div>
        </div>
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/53.gif" />
                Pullups – aim for 3 sets of 5-8 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/54.gif" />
                Pendlay Rows – aim for 3 sets of 6-10 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/55.gif" />
                Pulldowns – aim for 3 sets of 6-10 reps
            </div>
        </div>

    </div>

    <div class="content daytxt">
        Day 2: Legs Workout
                <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/56.gif" />
                Squats: work 5 rep max on day 2

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/57.gif" />
                Leg Press – aim for 3 sets of 6-10 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/58.gif" />
                Stiff-Legged Deadlift – aim for 5 sets of 5 reps

            </div>
        </div>
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/59.gif" />
                Hamstring Curls – aim for 3 sets of 6-8 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/60.gif" />
                Calf-Raise – aim for 5 sets of 10 reps

            </div>
        </div>

    </div>

    <div class="content daytxt">
        Day 3: Shoulders and Arms Workout
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/61.gif" />
                Military Press or Dumbbell Press – aim for 3 sets of 6-8

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/62.gif" />
                Lateral Raises – aim for 5 sets of 10 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/63.gif" />
                Barbell Curls – aim for 5 sets of 6-10 reps

            </div>
        </div>
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/64.gif" />
                Dumbbell Curls – aim for 3 sets of 6-10 reps

            </div>
        </div>
    </div>

    <div class="content daytxt">
        Day 4: Rest</div>

    <div class="content daytxt">
        Day 5: Chest, Shoulders, and Triceps Workout
                <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/65.gif" />
                Flat Dumbbell Press – aim for 5 sets of 20-6 (Pyramiding) reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/66.gif" />
                Incline Dumbbell Press – aim for 3 sets of 6-10 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/67.gif" />
                Hammer Strength Press – aim for 3 sets of 10 reps

            </div>
        </div>
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/68.gif" />
                Cable Flys – aim for 3 sets of 12-15 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/69.gif" />
                Lateral Raises – aim for 5 sets of 15-20 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/70.gif" />
                Reverse-Grip Pull-Downs – aim for 5 sets of 15-20 reps
            </div>
        </div>
    </div>

    <div class="content daytxt">
        Day 6: Back and Biceps Workout
                        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/71.gif" />
                Barbell Rows – aim for 5 sets of 20-8 (Pyramiding) reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/72.gif" />
                Barbell Shrugs – aim for 3 sets of 15-20 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/73.gif" />
                Rack Deadlifts – aim for 3 sets of 10-12 reps

            </div>
        </div>
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/74.gif" />
                Pullups – aim for 3 sets of 6-10 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/75.gif" />
                Pulldowns – aim for 3 sets of 6-10 reps

            </div>
        </div>
    </div>

    <div class="content daytxt">
        Day 7: Legs Workout
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/76.gif" />
                Front Squats – aim for 5 sets of 20-8 (Pyramiding) reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/77.gif" />
                Leg Extensions – aim for 5 sets of 10 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/78.gif" />
                Hamstring Curls – aim for 5 sets of 6-10 reps

            </div>
        </div>
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/79.gif" />
                Seated Calf Raise – aim for 5 sets of 6-10 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/80.gif" />
                Standing Calf Raise – aim for 3 sets of 8-12 reps

            </div>
    </div>
</asp:Content>
