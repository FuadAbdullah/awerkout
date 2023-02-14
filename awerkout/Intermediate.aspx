<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="Intermediate.aspx.cs" Inherits="awerkout.Intermediate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="mainstyle.css" />
    <link rel="stylesheet" href="workoutplandetailstyle.css" />
    <style type="text/css">
        .auto-style1 {
            font-size: large;
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
    <div class="header">
        <img src="Images/Intermediate header.PNG" id="imgheader"/>
        <div id="txt"> 
            <span style="white-space:pre-wrap;">Intermediate Workout Routine for Men</span><br />
            <br />
            <div class="auto-style1">
                If you are already hitting the gym for some time and 
                are well-acquainted with various workout programs for
                men, then you should follow this intermediate workout routine.
            <br />
            <br />
                Following this fitness regimen would help you burn fat steadily 
                without putting too much pressure on your body. The five-day 
                split is aimed at helping you gain impressive muscle gain. 
                It is one of the best workout routines for intermediates.</div>
        </div>
    </div>
    <div class="clear"></div>
    <div class="content daytxt">
        Day 1: Chest, Shoulders and Triceps
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/19.gif" />
                Dumbbell Bench Press – target 3 sets of 10, 10, 8 (by adding weight) reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/20.gif" />
                Incline Dumbbell Bench Press – target 3 sets of 10 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/21.gif" />
                Chest Dip – target 3 sets of MAX reps

            </div>
        </div>
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/22.gif" />
                Skullcrushers – target 3 sets of 8-10 Reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/23.gif" />
                One Arm Dumbbell Extension – target 3 sets of 10 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/24.gif" />
                Tricep Extension – target 3 sets of 10 reps
            </div>
        </div>
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/25.gif" />
                Barbell Front Raise – target 4 sets of 12 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/26.gif" />
                Dumbbell Lateral Raise – target 4 sets of 15, 12, 8, 8 (by adding weight) reps

            </div>
        </div>
    </div>
    <div class="content daytxt">
        Day 2: Back and Biceps
         <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/27.gif" />
                Wide Grip Pull Up – target 3 sets of MAX reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/28.gif" />
                Lat Pull Down – target 3 sets of 10 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/29.gif" />
                Straight Arm Lat Pull Down – target 3 sets of 10 reps

            </div>
        </div>
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/30.gif" />
                Machine Reverse Fly – target 3 sets of 10 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/31.gif" />
                Upright Row – target 3 sets of 8 to 10 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/32.gif" />
                Standing Barbell Curl – target 3 sets of 8 to 10 reps
            </div>
        </div>
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/33.gif" />
                Preacher Curl – target 3 sets of 10 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/34.gif" />
                Incline Dumbbell Curl – target 3 sets of 10 reps

            </div>
        </div>
    </div>
    <div class="content daytxt">
        Day 3: Legs
         <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/35.gif" />
                Squat – target 4 sets of 10,10,8,8 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/36.gif" />
                Dumbbell Lunge – target 3 sets of 8 on each leg

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/37.gif" />
                45 Degree Leg Press – target 3 sets of 12 reps

            </div>
        </div>
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/38.gif" />
                Leg Curl – target 3 sets of 15 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/39.gif" />
                Leg Extension – target 3 sets of 15 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/40.gif" />
                Standing Calf Raise – target 5 sets of 10,8,8,8,6 (of heavy)reps
            </div>
        </div>
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/41.gif" />
                Seated Calf Raise – target 5 sets of 15 (of light) reps

            </div>
        </div>
    </div>
    <div class="content daytxt">
        Day 4: Shoulders, chest, and Triceps
         <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/42.gif" />
                Barbell Bench Press – target 3 sets of 10, 10, 8 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/43.gif" />
                Dumbbell Flys – target 3 sets of 10 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/44.gif" />
                Cable Crossovers – target 3 sets of 10 reps

            </div>
        </div>
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/45.gif" />
                Close Grip Bench Press – target 4 sets of 10, 10, 8, 6 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/46.gif" />
                Lying Dumbbell Extension – target 3 sets of 10 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/47.gif" />
                Tricep Kickback – target 3 sets of 10 reps
            </div>
        </div>
        <div class="row">
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/48.gif" />
                Seated Dumbbell Press – target 4 sets of 10, 10, 8, 8 reps

            </div>
            <div class="workout">
                <img class="workoutimg" src="WorkoutContent/49.gif" />
                One Arm Cable Lateral Raise – target 3 sets of 12 reps

            </div>
        </div>
    </div>
</asp:Content>
