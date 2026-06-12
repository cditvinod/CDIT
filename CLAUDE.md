# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**Chai Dhaba** is an ASP.NET 4.5 Web Forms e-commerce application for a tea/chai delivery service based in Bokaro, Jharkhand, India. It is a traditional .NET Framework app with no Node.js, no bundler, and no test framework.

## Development Environment

- **Runtime**: .NET Framework 4.5 (not .NET Core/5+)
- **IDE**: Visual Studio (uses IIS Express for local hosting)
- **Database**: SQL Server Express — `DESKTOP\SQLEXPRESS`, catalog `thechaidhaba`
- **Build via CLI**: `msbuild CDIT.sln` (or open in Visual Studio and press F5)

There are no npm scripts, no lint commands, and no automated test suite.

## Architecture

### Directory Layout

```
/                   Customer-facing pages + root master page
/admin/             Admin panel pages + admin master page
/users/             Authenticated-user pages (cart, orders, profile)
/App_Code/          Shared server-side classes (compiled at runtime)
/css/, /js/, /img/  Static assets
```

### Two Master Pages

- `MasterPage.master` — used by all customer-facing pages. Exposes a public `Cart()` method that child pages call after mutating the cart to refresh the nav cart count.
- `admin/admin.master` — used by all admin pages.

### Session Keys

| Key | Set by | Meaning |
|---|---|---|
| `Session["CustomerLogin"]` | `Login.aspx.cs` | Customer's `CustomerId` (= mobile number). `null` means guest. |
| `Session["adminlogin"]` | `adminlogin.aspx.cs` | Non-null means admin is authenticated. |
| `Session["TotAmt"]` | `cart.aspx.cs` | Order total, read on `OrderPlaced.aspx`. |

All page-level auth guards check these keys and redirect to `Default.aspx` or `~/Default.aspx` on failure.

### Database Access Pattern

All DB access is done via raw ADO.NET with string-concatenated SQL — **no ORM, no parameterized queries**. The single shared helper is:

```csharp
// App_Code/connection.cs
SqlConnection c = connection.getConnection(); // returns a new, closed SqlConnection
```

Each page instantiates `c` as a field and manually calls `c.Open()` / `c.Close()` around each operation. The `SqlDataAdapter.Fill()` pattern (used for GridViews/Repeaters) does not require explicit Open/Close.

### Database Tables

| Table | Key Columns |
|---|---|
| `Customers` | `CustomerId` (= mobile no.), `Name`, `Mobile`, `Password`, `Email`, `Address`, `City`, `State`, `OTP`, `Status` (`Active`/`Inactive`) |
| `tea_table` | `ItemId` (format `TEA###`), `Name`, `Price`, `Sugar`, `Photo` |
| `Cart` | `CartId`, `CustomerId`, `ItemId`, `ItemName`, `Sugar`, `Rate`, `QtyOrdered`, `Amt`, `SessionId` |
| `Orders` | `OrderId` (format `O00{n}`), `Date`, `CustomerId`, `Name`, `ItemId`, `ItemName`, `Sugar`, `QtyOrdered`, `Rate`, `Amt`, `Status` |
| `admin` | `userid`, `password` |

`CustomerId` is the customer's mobile number — it doubles as the login username.

### Order Lifecycle

```
Cart (tea selected on Default.aspx)
  → users/Cart.aspx (review + Checkout button inserts rows into Orders)
  → cart.aspx (root-level cart, handles total + session)
  → Payment.aspx (displays UPI QR codes; no real gateway — always redirects to OrderPlaced)
  → OrderPlaced.aspx (sends SMS to customer + owner)
```

Admin status progression: `Active` → `Processing` → `Order Sent` → `Delivered` / `Cancelled`. Each transition in `admin/Orders.aspx.cs` calls `SMS.SendSMS()`.

### SMS Service (`App_Code/SMS.cs`)

Wraps `bulksms.cdit.in` REST API. Sender ID is `CHAIDB`. Called at: signup OTP, registration confirmation, order placement, and each order status change. The AUTH_KEY placeholder (`#`) in the URL is substituted at the API level — the actual key is not in this repo.

### Payment Page Behavior

`Payment.aspx` only displays static UPI QR code images (Paytm, Google Pay, PhonePe, BHIM, Bank Transfer). There is no payment gateway integration. On mobile devices (`Request.Browser.IsMobileDevice`), it skips directly to `OrderPlaced.aspx`.

## Key Conventions

- **Remote DB config**: `connection.cs` contains a commented-out remote connection string (`199.79.62.22`). Switch the active line to deploy to the hosted SQL Server.
- **ItemId format**: Tea items use `TEA###`; the product list is ordered by `CAST(substring(ItemId,4,3) AS int)`.
- **OrderId generation**: Computed as `"O00" + (COUNT(Orders) + 1)` — not a DB-generated identity.
- **Guest cart**: Unauthenticated users can add items; cart rows use `Session.SessionID` as `SessionId`. On login, these are not automatically merged.
- **Admin auth**: `Session["adminlogin"]` is checked at the top of each admin `Page_Load`; there is no role/claims system.
