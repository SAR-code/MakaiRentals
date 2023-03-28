import { lazy } from "react";

const EmergencyContactsForm = lazy(() =>
  import("../components/emergencycontacts/EmergencyContactForm")
);

const EmergencyContactsList = lazy(() =>
  import("../components/emergencycontacts/EmergencyContactList")
);

const emergencyContactRoutes = [
    {
      path: "/emergency/contact/new",
      name: "EmergencyContacts",
      exact: true,
      element: EmergencyContactsForm,
      roles: ["Admin", "User"],
      isAnonymous: false,
    },
    {
      path: "/emergency/contact/:id/edit",
      name: "EmergencyContacts",
      exact: true,
      element: EmergencyContactsForm,
      roles: ["Admin", "User"],
      isAnonymous: false,
    },
    {
      path: "/emergency/contacts/:id",
      name: "EmergencyContactsList",
      exact: true,
      element: EmergencyContactsList,
      roles: ["Admin", "User"],
      isAnonymous: false,
    },
  ];

  const allRoutes = [ ...emergencyContactRoutes];

  export default allRoutes;