package org.example.valueObjects;

import jakarta.persistence.Embeddable;
import lombok.Data;

@Data
@Embeddable
public class CardInformation {
    public String cardNumber;
    public int ExpiresMonth;
    public int ExpiresYear;
    public int SecurityCode;
    public String cardName;
}
