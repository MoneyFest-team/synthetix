pragma solidity >=0.4.24;


interface ISystemStatus {
    struct Status {
        bool canSuspend;
        bool canResume;
    }

    // Views
    function accessControl(bytes32 section, address account) external view returns (bool canSuspend, bool canResume);

    function requireSystemActive() external view;

    function requireIssuanceActive() external view;

    function requireExchangeActive() external view;

    function requireSynthActive(bytes32 currencyKey) external view;

    function requireSynthsActive(bytes32 sourceCurrencyKey, bytes32 destinationCurrencyKey) external view;

    // Restricted functions
    function suspendSynth(bytes32 currencyKey, uint256 reason) external;
}
