class ParcelOrderData {
  final String trackingId;
  final String supportRequestId;
  final String itemName;
  final String currentHub;
  final String processingStage;
  final String destination;
  final String estimatedDelivery;
  final String nextUpdate;
  final String updatedAt;
  final String delayAlertTime;
  final String delayShortReason;
  final String delayDetailedReason;
  final String resolutionHubStatus;
  final String resolutionSummary;
  final bool isUrgentEligible;

  const ParcelOrderData({
    required this.trackingId,
    required this.supportRequestId,
    required this.itemName,
    required this.currentHub,
    required this.processingStage,
    required this.destination,
    required this.estimatedDelivery,
    required this.nextUpdate,
    required this.updatedAt,
    required this.delayAlertTime,
    required this.delayShortReason,
    required this.delayDetailedReason,
    required this.resolutionHubStatus,
    required this.resolutionSummary,
    this.isUrgentEligible = false,
  });
}

class ParcelTrackingSampleData {
  ParcelTrackingSampleData._();

  static const String trackingId = 'SPXVN-DEMO-261102-0042';
  static const String supportRequestId = 'DR-261102-0482';
  static const String currentHub = 'Sorting Hub – Ho Chi Minh City';
  static const String destination = 'Thu Duc City, Ho Chi Minh City';
  static const String estimatedDelivery = '04–05/11/2026';

  static const List<ParcelOrderData> sampleOrders = [
    ParcelOrderData(
      trackingId: 'SPXVN-DEMO-261102-0042',
      supportRequestId: 'DR-261102-0482',
      itemName: 'Sony WH-1000XM5 Wireless Headphones',
      currentHub: 'Sorting Hub – Ho Chi Minh City',
      processingStage: 'Awaiting sorting',
      destination: 'Thu Duc City, Ho Chi Minh City',
      estimatedDelivery: '04–05/11/2026',
      nextUpdate: 'Before 08:30\non 03/11/2026',
      updatedAt: '14:20, 02/11/2026 ICT',
      delayAlertTime: '14:30, 02/11/2026 · ICT (UTC+7)',
      delayShortReason: 'sorting backlog.',
      delayDetailedReason:
          'A hub backlog is delaying sorting.\nYour parcel cannot move to the next\nfacility until sorting is complete.',
      resolutionHubStatus: 'Left the sorting hub',
      resolutionSummary:
          'Sorting delay resolved. Your parcel is on its\nway to the next facility, not yet delivered.\nRequest DR-261102-0482 closed at 08:00,\n03/11/2026 ICT.',
      isUrgentEligible: false,
    ),
    ParcelOrderData(
      trackingId: 'SPXVN-DEMO-261102-0189',
      supportRequestId: 'DR-261102-0819',
      itemName: 'Keychron Q1 Pro Wireless Mechanical Keyboard',
      currentHub: 'Thu Duc Delivery Hub – HCMC',
      processingStage: 'At local hub (2 days without update)',
      destination: 'Hiep Binh Chanh, Thu Duc City',
      estimatedDelivery: '03–04/11/2026',
      nextUpdate: 'Before 10:00\non 03/11/2026',
      updatedAt: '09:15, 01/11/2026 ICT',
      delayAlertTime: '11:00, 02/11/2026 · ICT (UTC+7)',
      delayShortReason: 'local courier shortage (held 2 days at local hub).',
      delayDetailedReason:
          'Your parcel arrived at your local delivery hub\n2 days ago, but dispatch is delayed due to high\ncourier volume in your area.',
      resolutionHubStatus: 'Dispatched via SPX Instant',
      resolutionSummary:
          'Local hub delay resolved. Your parcel has been\nprioritized for SPX Instant delivery today.\nRequest DR-261102-0819 closed at 08:00,\n03/11/2026 ICT.',
      isUrgentEligible: true,
    ),
    ParcelOrderData(
      trackingId: 'SPXVN-DEMO-261102-0315',
      supportRequestId: 'DR-261102-0954',
      itemName: 'Nike Pegasus 41 Running Shoes (US 9)',
      currentHub: 'Cu Chi Mega SOC – HCMC',
      processingStage: 'Linehaul transit delay',
      destination: 'District 7, Ho Chi Minh City',
      estimatedDelivery: '05–06/11/2026',
      nextUpdate: 'Before 12:00\non 03/11/2026',
      updatedAt: '13:45, 02/11/2026 ICT',
      delayAlertTime: '14:00, 02/11/2026 · ICT (UTC+7)',
      delayShortReason: 'linehaul truck congestion.',
      delayDetailedReason:
          'Heavy traffic on the inter-hub route is delaying\nlinehaul arrival. Your parcel will be scanned as\nsoon as the transport truck docks.',
      resolutionHubStatus: 'Arrived at District 7 Hub',
      resolutionSummary:
          'Linehaul delay resolved. Your parcel has docked\nat the destination hub, not yet delivered.\nRequest DR-261102-0954 closed at 08:00,\n03/11/2026 ICT.',
      isUrgentEligible: false,
    ),
    ParcelOrderData(
      trackingId: 'SPXVN-DEMO-261102-0527',
      supportRequestId: 'DR-261102-1102',
      itemName: 'LG UltraGear 27" QHD 180Hz Gaming Monitor',
      currentHub: 'Binh Thanh Local Hub – HCMC',
      processingStage: 'At local hub (1 day without update)',
      destination: 'Ward 25, Binh Thanh District',
      estimatedDelivery: '03–04/11/2026',
      nextUpdate: 'Before 09:00\non 03/11/2026',
      updatedAt: '16:10, 01/11/2026 ICT',
      delayAlertTime: '16:30, 02/11/2026 · ICT (UTC+7)',
      delayShortReason: 'oversized parcel awaiting local dispatch (1 day).',
      delayDetailedReason:
          'Your parcel has reached your local hub for over\n24 hours without delivery update while awaiting\na dedicated vehicle for bulky items.',
      resolutionHubStatus: 'Out for delivery (SPX Instant)',
      resolutionSummary:
          'Local hub hold resolved. Assigned to SPX Instant\ncourier for priority drop-off today.\nRequest DR-261102-1102 closed at 08:00,\n03/11/2026 ICT.',
      isUrgentEligible: true,
    ),
  ];

  static ParcelOrderData findByTrackingId(String id) {
    final normalized = id.trim().toUpperCase();
    for (final order in sampleOrders) {
      if (order.trackingId.toUpperCase() == normalized) {
        return order;
      }
    }
    return sampleOrders.first;
  }
}
