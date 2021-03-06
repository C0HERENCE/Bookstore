﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="BookStoreUI.PlaceOrder" %>

<%@ Register Src="~/Controls/OrderBookRow.ascx" TagPrefix="uc1" TagName="OrderBookRow" %>
<%@ Register Src="~/Controls/AddressAddModal.ascx" TagPrefix="uc1" TagName="AddressAddModal" %>
<%@ Register Src="~/Controls/AddressRow.ascx" TagPrefix="uc1" TagName="AddressRow" %>
<%@ Register Src="~/Controls/Modal.ascx" TagPrefix="uc1" TagName="Modal" %>




<asp:Content ID="Content1" ContentPlaceHolderID="StyleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="row small text-muted">
            <div class="col-2">
                订单编号: <asp:Label ID="txtOrderID" runat="server" Text="100001"></asp:Label>
            </div>
            <div class="col-2">
                用户编号: <asp:Label ID="txtUserID" runat="server" Text="100001"></asp:Label>
            </div>
            <div class="col-3">
                创建时间: <asp:Label ID="txtDateTime" runat="server" Text="100001"></asp:Label>
            </div>
            <div class="col-3">
                订单状态: <asp:Label ID="txtStatus" runat="server" Text="100001"></asp:Label>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 p-1 bg-white rounded shadow-sm mb-5">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col" class="border-0 bg-light">
                                    <div class="p-2 px-3">名称</div>
                                </th>
                                <th scope="col" class="border-0 bg-light">
                                    <div class="py-2">单价</div>
                                </th>
                                <th scope="col" class="border-0 bg-light">
                                    <div class="py-2">数量</div>
                                </th>
                                <th scope="col" class="border-0 bg-light">
                                    <div class="py-2">合计</div>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:PlaceHolder ID="orderBookContent" runat="server"></asp:PlaceHolder>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="dropdown" style="width:100%">
              <button class="btn dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"  style="width:100%;text-align:left">
                    <uc1:AddressRow runat="server" ID="AddressRowManage" />
              </button>
              <div class="dropdown-menu" aria-labelledby="dropdownMenu2"  style="width:100%">
                  <asp:PlaceHolder ID="AddressHolder" runat="server">
                  </asp:PlaceHolder>
              </div>
            </div>
        </div>

        <div class="row py-5 p-4 bg-white rounded shadow-sm">
            <div class="col-lg-6">
                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">优惠码</div>
                <div class="p-4">
                    <p class="font-italic mb-4">如果你要使用优惠码，请填写在下方</p>
                    <div class="input-group mb-4 border rounded-pill p-2">
                        <input type="text" placeholder="填写优惠码" aria-describedby="button-addon3" class="form-control border-0">
                        <div class="input-group-append border-0">
                            <button id="button-addon3" type="button" class="btn btn-danger px-4 rounded-pill"><i class="fa fa-gift mr-2"></i>使用</button>
                        </div>
                    </div>
                </div>
                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">订单备注</div>
                <div class="p-4">
                    <p class="font-italic mb-4">如果你有备注的信息，可以写在这里</p>
                    <asp:TextBox ID="txtComment" runat="server"  class="form-control" cols="30" rows="2" TextMode="MultiLine" OnTextChanged="txtComment_TextChanged" AutoPostBack="true"></asp:TextBox>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">订单总览 </div>
                <div class="p-4">
                    <p class="font-italic mb-4">邮费基于你的收获地址</p>
                    <ul class="list-unstyled mb-4">
                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">商品总价 </strong><strong>
                            <asp:Label ID="txtOrderPrice" runat="server" Text="0.00"></asp:Label>元</strong></li>
                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">邮费</strong><strong>
                            <asp:Label ID="txtExtraPrice" runat="server" Text="0.00"></asp:Label>元</strong></li>
                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">优惠</strong><strong>
                            -<asp:Label ID="txtOffPrice" runat="server" Text="0.00"></asp:Label>元</strong></li>
                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">需要付款</strong>
                            <h5 class="font-weight-bold">
                                <asp:Label ID="txtTotalPrice" runat="server" Text="0.00">元</asp:Label>
                            </h5>
                        </li>
                    </ul>
                    <div class="float-right">
                        <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-danger rounded-pill py-2" Text="取消订单" OnClick="btnCancel_Click" />
                        <asp:Button ID="btnCheck" runat="server" CssClass="btn btn-success rounded-pill py-2" Text="立即付款" OnClick="btnCheck_Click" />
                    </div>
                </div>
            </div>
        </div>
        <uc1:Modal runat="server" ID="Modal" />
    </div>
    <script src="Public/JS/bootstrap-input-spinner.js"></script>
    <script>
        $("input[type='number']").inputSpinner({
            buttonsClass: "btn-outline-primary",
            groupClass: "text-primary"
        });
    </script>
</asp:Content>
